package com.eduflex.manage.exam.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.service.IExamAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 考试答案记录Controller
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@RestController
@RequestMapping("/manage/exam/answer")
public class ExamAnswerController extends BaseController {

    @Autowired
    private IExamAnswerService examAnswerService;

    /**
     * 查询考试答案记录列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(ExamAnswer examAnswer) {
        startPage();
        List<ExamAnswer> list = examAnswerService.selectExamAnswerList(examAnswer);
        return getDataTable(list);
    }

    /**
     * 导出考试答案记录列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试答案记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamAnswer examAnswer) {
        List<ExamAnswer> list = examAnswerService.selectExamAnswerList(examAnswer);
        ExcelUtil<ExamAnswer> util = new ExcelUtil<>(ExamAnswer.class);
        util.exportExcel(response, list, "考试答案记录数据");
    }

    /**
     * 获取考试答案记录详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(examAnswerService.getById(id));
    }

    /**
     * 新增考试答案记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试答案记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamAnswer examAnswer) {
        return toAjax(examAnswerService.save(examAnswer));
    }

    /**
     * 修改考试答案记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试答案记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamAnswer examAnswer) {
        return toAjax(examAnswerService.updateById(examAnswer));
    }

    /**
     * 删除考试答案记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试答案记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable("ids") Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examAnswerService.removeByIds(idList));
    }
}

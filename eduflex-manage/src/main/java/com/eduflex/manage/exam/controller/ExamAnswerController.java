package com.eduflex.manage.exam.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.service.IExamAnswerService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 考试答案记录Controller
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@RestController
@RequestMapping("/manage/exam/answer")
public class ExamAnswerController extends BaseController
{
    @Autowired
    private IExamAnswerService examAnswerService;

    /**
     * 查询考试答案记录列表
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamAnswer examAnswer)
    {
        startPage();
        List<ExamAnswer> list = examAnswerService.selectExamAnswerList(examAnswer);
        return getDataTable(list);
    }

    /**
     * 导出考试答案记录列表
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:export')")
    @Log(title = "考试答案记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamAnswer examAnswer)
    {
        List<ExamAnswer> list = examAnswerService.selectExamAnswerList(examAnswer);
        ExcelUtil<ExamAnswer> util = new ExcelUtil<>(ExamAnswer.class);
        util.exportExcel(response, list, "考试答案记录数据");
    }

    /**
     * 获取考试答案记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(examAnswerService.getById(id));
    }

    /**
     * 新增考试答案记录
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:add')")
    @Log(title = "考试答案记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamAnswer examAnswer)
    {
        return toAjax(examAnswerService.save(examAnswer));
    }

    /**
     * 修改考试答案记录
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:edit')")
    @Log(title = "考试答案记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamAnswer examAnswer)
    {
        return toAjax(examAnswerService.updateById(examAnswer));
    }

    /**
     * 删除考试答案记录
     */
    @PreAuthorize("@ss.hasPermi('manage:answer:remove')")
    @Log(title = "考试答案记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examAnswerService.removeByIds(idList));
    }
}

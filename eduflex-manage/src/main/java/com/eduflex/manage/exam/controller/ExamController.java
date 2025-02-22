package com.eduflex.manage.exam.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.domain.vo.ExamVo;
import com.eduflex.manage.exam.service.IExamService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 考试管理Controller
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@RestController
@RequestMapping("/manage/exam")
public class ExamController extends BaseController {
    @Autowired
    private IExamService examService;

    /**
     * 查询考试管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:list')")
    @GetMapping("/list")
    public TableDataInfo list(Exam exam) {
        startPage();
        PageInfo<Exam> pageInfo = new PageInfo<>(examService.selectExamList(exam));
        List<ExamVo> list = examService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出考试管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:export')")
    @Log(title = "考试管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Exam exam) {
        List<ExamVo> list = examService.buildVo(examService.selectExamList(exam));
        ExcelUtil<ExamVo> util = new ExcelUtil<>(ExamVo.class);
        util.exportExcel(response, list, "考试管理数据");
    }

    /**
     * 获取考试管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(examService.getById(id));
    }

    /**
     * 新增考试管理
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:add')")
    @Log(title = "考试管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Exam exam) {
        exam.setCreateBy(getUsername());
        exam.setCreateTime(DateUtils.getNowDate());
        return toAjax(examService.save(exam));
    }

    /**
     * 修改考试管理
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:edit')")
    @Log(title = "考试管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Exam exam) {
        exam.setUpdateBy(getUsername());
        exam.setUpdateTime(DateUtils.getNowDate());
        return toAjax(examService.updateById(exam));
    }

    /**
     * 删除考试管理
     */
    @PreAuthorize("@ss.hasPermi('manage:exam:remove')")
    @Log(title = "考试管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examService.removeByIds(idList));
    }
}

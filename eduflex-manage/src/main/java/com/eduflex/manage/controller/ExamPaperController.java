package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.dto.PaperDto;
import com.eduflex.manage.domain.vo.ExamPaperVo;
import com.eduflex.manage.service.IExamPaperQuestionService;
import com.eduflex.manage.service.IExamPaperRepoService;
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
import com.eduflex.manage.domain.ExamPaper;
import com.eduflex.manage.service.IExamPaperService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 试卷管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/manage/paper")
public class ExamPaperController extends BaseController
{
    @Autowired
    private IExamPaperService examPaperService;

    @Autowired
    private IExamPaperQuestionService examPaperQuestionService;

    @Autowired
    private IExamPaperRepoService examPaperRepoService;

    /**
     * 查询试卷管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(ExamPaper examPaper)
    {
        startPage();
        List<ExamPaperVo> list = examPaperService.selectExamPaperList(examPaper);
        return getDataTable(list);
    }

    /**
     * 导出试卷管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamPaper examPaper)
    {
        List<ExamPaperVo> list = examPaperService.selectExamPaperList(examPaper);
        ExcelUtil<ExamPaperVo> util = new ExcelUtil<>(ExamPaperVo.class);
        util.exportExcel(response, list, "试卷管理数据");
    }

    /**
     * 获取试卷管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(examPaperService.getById(id));
    }

    /**
     * 新增试卷管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.save(examPaper));
    }

    /**
     * 修改试卷管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.updateById(examPaper));
    }

    /**
     * 删除试卷管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examPaperService.removeByIds(idList));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷题目管理", businessType = BusinessType.INSERT)
    @PostMapping("/question")
    public AjaxResult addQuestion(@RequestBody List<ExamPaperQuestion> questionList)
    {
        return toAjax(examPaperQuestionService.saveOrUpdateBatch(questionList));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/question/{id}")
    public AjaxResult getPaperQuestion(@PathVariable Long id) {
        return success(examPaperQuestionService.selectQuestionByPaperId(id));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @PostMapping("/compose")
    public AjaxResult composePaper(@RequestBody PaperDto paperDto) {
        return success(examPaperService.composePaper(paperDto));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/repo/{id}")
    public AjaxResult getPaperRepo(@PathVariable Long id) {
        return success(examPaperRepoService.selectRepoByPaperId(id));
    }
}

package com.eduflex.manage.paper.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.paper.domain.Paper;
import com.eduflex.manage.paper.domain.PaperQuestion;
import com.eduflex.manage.paper.domain.dto.PaperDto;
import com.eduflex.manage.paper.domain.dto.PaperQuestionDto;
import com.eduflex.manage.paper.domain.vo.PaperVo;
import com.eduflex.manage.paper.service.IPaperQuestionService;
import com.eduflex.manage.paper.service.IPaperRepoService;
import com.eduflex.manage.paper.service.IPaperService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 试卷管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/manage/paper")
public class PaperController extends BaseController
{
    @Autowired
    private IPaperService examPaperService;

    @Autowired
    private IPaperQuestionService examPaperQuestionService;

    @Autowired
    private IPaperRepoService examPaperRepoService;

    /**
     * 查询试卷管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Paper paper)
    {
        startPage();
        PageInfo<Paper> pageInfo = new PageInfo<>(examPaperService.selectExamPaperList(paper));
        List<PaperVo> list = examPaperService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出试卷管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Paper paper)
    {
        List<PaperVo> list = examPaperService.buildVo(examPaperService.selectExamPaperList(paper));
        ExcelUtil<PaperVo> util = new ExcelUtil<>(PaperVo.class);
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
    public AjaxResult add(@RequestBody Paper paper)
    {
        return toAjax(examPaperService.save(paper));
    }

    /**
     * 修改试卷管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "试卷管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Paper paper)
    {
        return toAjax(examPaperService.updateById(paper));
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
    public AjaxResult addQuestion(@RequestBody List<PaperQuestion> questionList)
    {
        return toAjax(examPaperQuestionService.saveOrUpdateBatch(questionList));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/question/{id}")
    public AjaxResult getPaperQuestion(@PathVariable Long id) {
        return success(examPaperQuestionService.selectQuestionByPaperId(id));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @PostMapping("/generate")
    public AjaxResult generateQuestions(@RequestBody PaperDto paperDto) {
        return success(examPaperService.generateQuestions(paperDto));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/repo/{id}")
    public AjaxResult getPaperRepo(@PathVariable Long id) {
        return success(examPaperRepoService.selectRepoListByPaperId(id));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @PostMapping("/compose")
    public AjaxResult composePaper(@RequestBody PaperQuestionDto paperQuestionDto) {
        return success(examPaperService.composePaper(paperQuestionDto));
    }
}

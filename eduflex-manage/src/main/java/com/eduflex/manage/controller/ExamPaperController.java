package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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

    /**
     * 查询试卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExamPaper examPaper)
    {
        startPage();
        List<ExamPaper> list = examPaperService.selectExamPaperList(examPaper);
        return getDataTable(list);
    }

    /**
     * 导出试卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:export')")
    @Log(title = "试卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamPaper examPaper)
    {
        List<ExamPaper> list = examPaperService.selectExamPaperList(examPaper);
        ExcelUtil<ExamPaper> util = new ExcelUtil<ExamPaper>(ExamPaper.class);
        util.exportExcel(response, list, "试卷管理数据");
    }

    /**
     * 获取试卷管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(examPaperService.selectExamPaperById(id));
    }

    /**
     * 新增试卷管理
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:add')")
    @Log(title = "试卷管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.insertExamPaper(examPaper));
    }

    /**
     * 修改试卷管理
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:edit')")
    @Log(title = "试卷管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamPaper examPaper)
    {
        return toAjax(examPaperService.updateExamPaper(examPaper));
    }

    /**
     * 删除试卷管理
     */
    @PreAuthorize("@ss.hasPermi('manage:paper:remove')")
    @Log(title = "试卷管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examPaperService.deleteExamPaperByIds(ids));
    }
}

package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.vo.QuestionVo;
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
import com.eduflex.manage.domain.Question;
import com.eduflex.manage.service.IQuestionService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 题目管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/manage/question")
public class QuestionController extends BaseController
{
    @Autowired
    private IQuestionService examQuestionService;

    /**
     * 查询题目管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Question question)
    {
        startPage();
        List<QuestionVo> list = examQuestionService.selectExamQuestionList(question);
        return getDataTable(list);
    }

    /**
     * 导出题目管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Question question)
    {
        List<QuestionVo> list = examQuestionService.selectExamQuestionList(question);
        ExcelUtil<QuestionVo> util = new ExcelUtil<>(QuestionVo.class);
        util.exportExcel(response, list, "题目管理数据");
    }

    /**
     * 获取题目管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(examQuestionService.getById(id));
    }

    /**
     * 新增题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Question question)
    {
        question.setCreateBy(getUsername());
        question.setCreateTime(DateUtils.getNowDate());
        return toAjax(examQuestionService.save(question));
    }

    /**
     * 修改题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Question question)
    {
        question.setUpdateBy(getUsername());
        question.setUpdateTime(DateUtils.getNowDate());
        return toAjax(examQuestionService.updateById(question));
    }

    /**
     * 删除题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examQuestionService.removeByIds(idList));
    }
}

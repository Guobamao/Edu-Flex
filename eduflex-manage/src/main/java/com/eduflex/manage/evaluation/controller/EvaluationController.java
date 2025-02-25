package com.eduflex.manage.evaluation.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.evaluation.domain.Evaluation;
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
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 课程评价管理Controller
 *
 * @author 林煜鋒
 * @date 2025-02-25
 */
@RestController
@RequestMapping("/manage/evaluation")
public class EvaluationController extends BaseController {
    @Autowired
    private IEvaluationService evaluationService;

    /**
     * 查询课程评价管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:list')")
    @GetMapping("/list")
    public TableDataInfo list(Evaluation evaluation) {
        startPage();
        List<Evaluation> list = evaluationService.selectEvaluationList(evaluation);
        return getDataTable(list);
    }

    /**
     * 导出课程评价管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:export')")
    @Log(title = "课程评价管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Evaluation evaluation) {
        List<Evaluation> list = evaluationService.selectEvaluationList(evaluation);
        ExcelUtil<Evaluation> util = new ExcelUtil<>(Evaluation.class);
        util.exportExcel(response, list, "课程评价管理数据");
    }

    /**
     * 获取课程评价管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(evaluationService.getById(id));
    }

    /**
     * 新增课程评价管理
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:add')")
    @Log(title = "课程评价管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Evaluation evaluation) {
        evaluation.setUserId(getUserId());
        evaluation.setCreateBy(getUsername());
        return toAjax(evaluationService.saveEvaluation(evaluation));
    }

    /**
     * 修改课程评价管理
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:edit')")
    @Log(title = "课程评价管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Evaluation evaluation) {
        evaluation.setUpdateBy(getUsername());
        return toAjax(evaluationService.updateById(evaluation));
    }

    /**
     * 删除课程评价管理
     */
    @PreAuthorize("@ss.hasPermi('manage:evaluation:remove')")
    @Log(title = "课程评价管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(evaluationService.removeByIds(idList));
    }
}

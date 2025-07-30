package com.eduflex.manage.evaluation.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.domain.vo.EvaluationVo;
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

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
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Evaluation evaluation) {
        startPage();
        PageInfo<Evaluation> pageInfo = new PageInfo<>(evaluationService.selectEvaluationList(evaluation));
        List<EvaluationVo> list = evaluationService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 评价统计
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/statistics/{courseId}")
    public AjaxResult statistics(@PathVariable("courseId") Long courseId) {
        return success(evaluationService.statistics(courseId));
    }

    /**
     * 导出课程评价管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程评价管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Evaluation evaluation) {
        List<EvaluationVo> list = evaluationService.buildVo(evaluationService.selectEvaluationList(evaluation));
        ExcelUtil<EvaluationVo> util = new ExcelUtil<>(EvaluationVo.class);
        util.exportExcel(response, list, "课程评价管理数据");
    }

    /**
     * 获取课程评价管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(evaluationService.getById(id));
    }

    /**
     * 新增课程评价管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
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
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程评价管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Evaluation evaluation) {
        evaluation.setUpdateBy(getUsername());
        return toAjax(evaluationService.updateById(evaluation));
    }

    /**
     * 删除课程评价管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程评价管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable("ids") Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(evaluationService.removeByIds(idList));
    }
}

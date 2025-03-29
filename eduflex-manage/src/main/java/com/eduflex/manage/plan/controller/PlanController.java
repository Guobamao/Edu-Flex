package com.eduflex.manage.plan.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.plan.domain.Plan;
import com.eduflex.manage.plan.domain.vo.PlanVo;
import com.eduflex.manage.plan.service.IPlanService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学习计划管理Controller
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */
@RestController
@RequestMapping("/manage/plan")
public class PlanController extends BaseController {

    @Autowired
    private IPlanService planService;

    /**
     * 查询学习计划管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Plan plan) {
        startPage();
        PageInfo<Plan> pageInfo = new PageInfo<>(planService.selectPlanList(plan));
        List<PlanVo> list = planService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出学习计划管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习计划管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Plan plan) {
        List<Plan> list = planService.selectPlanList(plan);
        ExcelUtil<Plan> util = new ExcelUtil<>(Plan.class);
        util.exportExcel(response, list, "学习计划管理数据");
    }

    /**
     * 获取学习计划管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        List<Plan> plan = List.of(planService.getById(id));
        return success(planService.buildVo(plan).get(0));
    }

    /**
     * 新增学习计划管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习计划管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Plan plan) {
        plan.setCreateBy(getUsername());
        return toAjax(planService.createPlan(plan));
    }

    /**
     * 修改学习计划管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习计划管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Plan plan) {
        plan.setUpdateBy(getUsername());
        plan.setUpdateTime(DateUtils.getNowDate());
        return toAjax(planService.updateById(plan));
    }

    /**
     * 删除学习计划管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习计划管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(planService.removeByIds(idList));
    }
}

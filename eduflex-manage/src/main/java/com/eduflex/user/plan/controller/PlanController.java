package com.eduflex.user.plan.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.plan.domain.Plan;
import com.eduflex.manage.plan.service.IPlanService;
import com.eduflex.user.plan.domain.dto.UserPlanDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 学习计划 - 用户端Controller
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */
@RestController(value = "UserPlanController")
@RequestMapping("/user/plan")
public class PlanController extends BaseController {

    @Autowired
    private IPlanService planService;

    @GetMapping("/list")
    public AjaxResult list(UserPlanDto userPlanDto) {
        userPlanDto.setUserId(getUserId());
        return AjaxResult.success(planService.selectPlanList(userPlanDto));
    }

    @PostMapping
    public AjaxResult add(@RequestBody Plan plan) {
        plan.setUserId(getUserId());
        return toAjax(planService.createPlan(plan));
    }

    @PutMapping
    public AjaxResult edit(@RequestBody Plan plan) {
        plan.setUserId(getUserId());
        return toAjax(planService.updatePlan(plan));
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(planService.getUserPlanById(id));
    }

    @DeleteMapping(value = "/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        return toAjax(planService.removeById(id));
    }
}

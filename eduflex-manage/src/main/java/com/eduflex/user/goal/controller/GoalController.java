package com.eduflex.user.goal.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.service.IGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 学习目标 - 用户端Controller
 * @author 林煜鋒
 */
@RestController(value = "UserGoalController")
@RequestMapping("/user/goal")
public class GoalController extends BaseController {

    @Autowired
    private IGoalService goalService;

    @GetMapping("/list")
    public AjaxResult list(Goal goal) {
        goal.setUserId(getUserId());
        return AjaxResult.success(goalService.selectUserGoalList(goal));
    }
}

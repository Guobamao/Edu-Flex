package com.eduflex.user.goal.controller;

import cn.hutool.core.bean.BeanUtil;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.service.IGoalService;
import com.eduflex.user.goal.domain.vo.UserGoalVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 学习目标 - 用户端Controller
 *
 * @author 林煜鋒
 */
@RestController(value = "UserGoalController")
@RequestMapping("/user/goal")
public class GoalController extends BaseController {

    @Autowired
    private IGoalService goalService;

    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(Goal goal) {
        startPage();
        goal.setUserId(getUserId());
        PageInfo<Goal> pageInfo = new PageInfo<>(goalService.selectGoalList(goal));
        List<UserGoalVo> userGoalVos = BeanUtil.copyToList(pageInfo.getList(), UserGoalVo.class);
        return getDataTable(userGoalVos, pageInfo.getTotal());
    }

    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        Goal goal = goalService.getById(id);
        return success(BeanUtil.copyProperties(goal, UserGoalVo.class));
    }

    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping
    public AjaxResult add(@RequestBody Goal goal) {
        goal.setUserId(getUserId());
        goal.setCreateBy(getUsername());
        return toAjax(goalService.save(goal));
    }

    @PreAuthorize("@ss.hasRole('student')")
    @PutMapping
    public AjaxResult edit(@RequestBody Goal goal) {
        goal.setUpdateBy(getUsername());
        return toAjax(goalService.updateById(goal));
    }

    @PreAuthorize("@ss.hasRole('student')")
    @DeleteMapping(value = "/{id}")
    public AjaxResult remove(@PathVariable("id") Long id) {
        return toAjax(goalService.removeGoal(id));
    }
}

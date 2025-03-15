package com.eduflex.manage.goal.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.domain.vo.GoalVo;
import com.eduflex.manage.goal.mapper.GoalMapper;
import com.eduflex.manage.goal.service.IGoalService;
import com.eduflex.manage.plan.domain.Plan;
import com.eduflex.manage.plan.service.IPlanService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 学习目标管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@Service
public class GoalServiceImpl extends ServiceImpl<GoalMapper, Goal> implements IGoalService {

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private IPlanService planService;

    @Override
    public List<Goal> selectGoalList(Goal goal) {
        LambdaQueryWrapper<Goal> wrapper = new LambdaQueryWrapper<Goal>()
                .like(StrUtil.isNotBlank(goal.getGoalName()), Goal::getGoalName, goal.getGoalName())
                .eq(goal.getStatus() != null, Goal::getStatus, goal.getStatus())
                .eq(goal.getUserId() != null, Goal::getUserId, goal.getUserId());
        return baseMapper.selectList(wrapper);
    }

    @Override
    @Transactional
    public int removeGoal(Long id) {
        baseMapper.deleteById(id);

        LambdaQueryWrapper<Plan> wrapper = new LambdaQueryWrapper<Plan>()
                .eq(Plan::getGoalId, id);

        return planService.remove(wrapper) ? 1 : 0;
    }

    @Override
    public List<GoalVo> buildVo(List<Goal> list) {
        ArrayList<GoalVo> goalVoList = new ArrayList<>();
        for (Goal goal : list) {
            GoalVo goalVo = new GoalVo();
            BeanUtils.copyProperties(goal, goalVo);
            SysUser sysUser = sysUserService.selectUserById(goal.getUserId());
            goalVo.setUserName(sysUser.getUserName());
            goalVo.setNickName(sysUser.getNickName());
            goalVoList.add(goalVo);
        }
        return goalVoList;
    }
}

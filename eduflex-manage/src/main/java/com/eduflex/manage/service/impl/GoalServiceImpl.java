package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.GoalMapper;
import com.eduflex.manage.domain.Goal;
import com.eduflex.manage.service.IGoalService;

/**
 * 学习目标管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@Service
public class GoalServiceImpl extends ServiceImpl<GoalMapper, Goal> implements IGoalService {
    @Override
    public List<Goal> selectLearningGoalList(Goal goal) {
        LambdaQueryWrapper<Goal> wrapper = new LambdaQueryWrapper<Goal>()
                .like(StrUtil.isNotBlank(goal.getGoalName()), Goal::getGoalName, goal.getGoalName());
        return baseMapper.selectList(wrapper);
    }
}

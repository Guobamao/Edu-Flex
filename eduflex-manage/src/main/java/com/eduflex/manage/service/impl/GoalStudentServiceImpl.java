package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.manage.domain.Goal;
import com.eduflex.manage.domain.vo.GoalStudentVo;
import com.eduflex.manage.service.IGoalService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.GoalStudentMapper;
import com.eduflex.manage.domain.GoalStudent;
import com.eduflex.manage.service.IGoalStudentService;

/**
 * 学习目标-学生关联Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
@Service
public class GoalStudentServiceImpl extends ServiceImpl<GoalStudentMapper, GoalStudent> implements IGoalStudentService {

    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private IGoalService goalService;

    @Override
    public List<GoalStudentVo> selectGoalStudentList(GoalStudent goalStudent) {
        LambdaQueryWrapper<GoalStudent> wrapper = new LambdaQueryWrapper<GoalStudent>()
                .eq(goalStudent.getUserId() != null, GoalStudent::getUserId, goalStudent.getUserId())
                .eq(goalStudent.getStatus() != null, GoalStudent::getStatus, goalStudent.getStatus());

        if (goalStudent.getProgress() != null) {
            wrapper.between(GoalStudent::getProgress, goalStudent.getProgress().get(0), goalStudent.getProgress().get(1));
        }

        List<GoalStudent> goalStudents = baseMapper.selectList(wrapper);
        List<GoalStudentVo> goalStudentVos = new ArrayList<>();

        for (GoalStudent goalStudent1 : goalStudents) {
            GoalStudentVo goalStudentVo = new GoalStudentVo();
            BeanUtils.copyProperties(goalStudent1, goalStudentVo);

            SysUser sysUser = sysUserService.selectUserById(goalStudent1.getUserId());
            Goal goal = goalService.getById(goalStudent1.getGoalId());

            goalStudentVo.setNickName(sysUser.getNickName());
            goalStudentVo.setGoalName(goal.getGoalName());

            goalStudentVos.add(goalStudentVo);
        }

        return goalStudentVos;
    }

    @Override
    public boolean checkGoalStudentExist(GoalStudent goalStudent) {
        LambdaQueryWrapper<GoalStudent> wrapper = new LambdaQueryWrapper<GoalStudent>()
                .eq(GoalStudent::getUserId, goalStudent.getUserId())
                .eq(GoalStudent::getGoalId, goalStudent.getGoalId());
        return baseMapper.selectCount(wrapper) > 0;
    }
}

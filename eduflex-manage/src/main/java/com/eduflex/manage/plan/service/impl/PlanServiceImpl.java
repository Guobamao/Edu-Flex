package com.eduflex.manage.plan.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.service.IGoalService;
import com.eduflex.manage.plan.domain.Plan;
import com.eduflex.manage.plan.domain.vo.PlanVo;
import com.eduflex.manage.plan.mapper.PlanMapper;
import com.eduflex.manage.plan.service.IPlanService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.plan.domain.dto.UserPlanDto;
import com.eduflex.user.plan.domain.vo.UserPlanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 学习计划管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */
@Service
public class PlanServiceImpl extends ServiceImpl<PlanMapper, Plan> implements IPlanService {

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private IGoalService goalService;

    @Override
    public List<Plan> selectPlanList(Plan plan) {
        LambdaQueryWrapper<Plan> wrapper = new LambdaQueryWrapper<Plan>()
                .eq(plan.getUserId() != null, Plan::getUserId, plan.getUserId())
                .like(plan.getTitle() != null, Plan::getTitle, plan.getTitle());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<PlanVo> buildVo(List<Plan> list) {
        List<PlanVo> planVos = new ArrayList<>();
        for (Plan plan : list) {
            PlanVo planVo = new PlanVo();
            BeanUtils.copyProperties(plan, planVo);
            SysUser sysUser = sysUserService.selectUserById(plan.getUserId());
            planVo.setUserName(sysUser.getUserName());
            planVo.setNickName(sysUser.getNickName());
            Goal goal = goalService.getById(plan.getGoalId());
            planVo.setGoalName(goal.getGoalName());
            planVos.add(planVo);
        }
        return planVos;
    }

    @Override
    public List<UserPlanVo> selectPlanList(UserPlanDto userPlanDto) {
        LambdaQueryWrapper<Plan> wrapper = new LambdaQueryWrapper<Plan>()
                .eq(userPlanDto.getUserId() != null, Plan::getUserId, userPlanDto.getUserId());
        return buildUserPlanVo(baseMapper.selectList(wrapper));
    }

    @Override
    public int createPlan(Plan plan) {
        if (DateUtil.isSameDay(plan.getStartTime(), plan.getEndTime())) {
            return baseMapper.insert(plan);
        } else {
            List<Plan> list = getPlanList(plan);
            return baseMapper.insert(list).size();
        }
    }

    @Override
    public int updatePlan(Plan plan) {
        if (DateUtil.isSameDay(plan.getStartTime(), plan.getEndTime())) {
            return baseMapper.updateById(plan);
        } else {
            List<Plan> list = getPlanList(plan);
            baseMapper.deleteById(plan);
            return baseMapper.insert(list).size();
        }
    }

    @Override
    public UserPlanVo getUserPlanById(Long id) {
        return buildUserPlanVo(List.of(baseMapper.selectById(id))).get(0);
    }

    private List<UserPlanVo> buildUserPlanVo(List<Plan> list) {
        List<UserPlanVo> userPlanVos = new ArrayList<>();
        for (Plan plan : list) {
            UserPlanVo userPlanVo = new UserPlanVo();
            BeanUtils.copyProperties(plan, userPlanVo);
            Goal goal = goalService.getById(plan.getGoalId());
            userPlanVo.setGoalName(goal.getGoalName());
            userPlanVos.add(userPlanVo);
        }
        return userPlanVos;
    }

    /**
     * 根据计划拆分出每天计划
     * @param plan 学习计划
     * @return 学习计划列表
     */
    private static List<Plan> getPlanList(Plan plan) {
        List<Plan> list = new ArrayList<>();
        Date startTime = plan.getStartTime();
        Date endTime = plan.getEndTime();
        String dailyStartStr = DateUtil.format(plan.getStartTime(), "HH:mm:ss");
        String dailyEndStr = DateUtil.format(plan.getEndTime(), "HH:mm:ss");

        Date currentDate = startTime;
        while (!currentDate.after(endTime)) {
            Plan splitPlan = new Plan();
            BeanUtils.copyProperties(plan, splitPlan);

            // 设置当天的开始和结束时间
            String currentDateStr = DateUtil.format(currentDate, DateUtils.YYYY_MM_DD);
            Date dayStart = DateUtil.parse(currentDateStr + " " + dailyStartStr);
            Date dayEnd = DateUtil.parse(currentDateStr + " " + dailyEndStr);

            // 第一天使用原始开始时间，最后一天使用原始结束时间
            if (DateUtil.isSameDay(currentDate, startTime)) {
                dayStart = startTime;
            }
            if (DateUtil.isSameDay(currentDate, endTime)) {
                dayEnd = endTime;
            }

            splitPlan.setStartTime(dayStart);
            splitPlan.setEndTime(dayEnd);
            list.add(splitPlan);

            // 移动到下一天
            currentDate = DateUtil.offsetDay(currentDate, 1);
        }
        return list;
    }
}

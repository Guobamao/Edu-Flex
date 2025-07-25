package com.eduflex.manage.plan.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
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

    @Override
    public void adjustPlan() {
        Date nowDate = DateUtils.getNowDate();
        LambdaQueryWrapper<Plan> wrapper = new LambdaQueryWrapper<Plan>()
                .in(Plan::getStatus, EduFlexConstants.STATUS_UNSTARTED, EduFlexConstants.STATUS_IN_PROGRESS)
                .lt(Plan::getEndTime, nowDate)
                .ge(Plan::getEndTime, DateUtil.beginOfDay(nowDate));

        // 逾期的学习计划
        List<Plan> overduePlans = baseMapper.selectList(wrapper);
        for (Plan overduePlan : overduePlans) {
            adjustPlanTime(overduePlan, nowDate);
        }
    }

    /**
     * 调整学习计划时间
     *
     * @param overduePlan 超期的学习计划
     * @param nowDate     当前时间
     */
    private void adjustPlanTime(Plan overduePlan, Date nowDate) {
        // 原计划时长
        long duration = DateUtil.between(overduePlan.getStartTime(), overduePlan.getEndTime(), DateUnit.MINUTE);

        // 当天结束时间
        DateTime dayEnd = DateUtil.endOfDay(nowDate);

        // 方案1：推迟到当天1小时后
        DateTime newStartTime = DateUtil.offsetHour(nowDate, 1);
        DateTime newEndTime = DateUtil.offsetMinute(newStartTime, (int) duration);

        if (newEndTime.isBefore(dayEnd) && !hasConflict(overduePlan, newStartTime, newEndTime)) {
            // 当天没有冲突，直接修改计划时间
        } else {
            // 方案2：推迟到下一天同一时间段
            newStartTime = DateUtil.offsetDay(nowDate, 1);
            newEndTime = DateUtil.offsetMinute(newStartTime, (int) duration);

            while (true) {
                if (!hasConflict(overduePlan, newStartTime, newEndTime)) {
                    break;
                }

                newStartTime = DateUtil.offsetHour(newStartTime, 1);
                newEndTime = DateUtil.offsetMinute(newStartTime, (int) duration);

                DateTime currentDayEnd = DateUtil.endOfDay(newStartTime);
                if (newEndTime.isAfter(currentDayEnd)) {
                    newStartTime = DateUtil.offsetDay(newStartTime, 1);
                    newEndTime = DateUtil.offsetMinute(newStartTime, (int) duration);
                }
            }
        }

        // 更新计划
        overduePlan.setStartTime(newStartTime);
        overduePlan.setEndTime(newEndTime);
        overduePlan.setAdjustCount(overduePlan.getAdjustCount() + 1);
        if (overduePlan.getReminderTime() != null) {
            overduePlan.setReminderTime(DateUtil.offsetMinute(newStartTime, -10));
        }
        baseMapper.updateById(overduePlan);
    }

    /**
     * 判断当前时间段是否存在冲突
     *
     * @param plan         学习计划
     * @param newStartTime 新的开始时间
     * @param newEndTime   新的结束时间
     * @return 是否存在冲突
     */
    private boolean hasConflict(Plan plan, DateTime newStartTime, DateTime newEndTime) {
        LambdaQueryWrapper<Plan> wrapper = new LambdaQueryWrapper<Plan>()
                .eq(Plan::getUserId, plan.getUserId())
                .ne(Plan::getId, plan.getId())
                .lt(Plan::getStartTime, newEndTime)
                .gt(Plan::getEndTime, newStartTime);
        return count(wrapper) > 0;
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
     *
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

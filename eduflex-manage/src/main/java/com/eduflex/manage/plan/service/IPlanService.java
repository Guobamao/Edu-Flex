package com.eduflex.manage.plan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.plan.domain.Plan;
import com.eduflex.manage.plan.domain.vo.PlanVo;
import com.eduflex.user.plan.domain.dto.UserPlanDto;
import com.eduflex.user.plan.domain.vo.UserPlanVo;

import java.util.List;

/**
 * 学习计划管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */
public interface IPlanService extends IService<Plan> {
    /**
     * 查询学习计划管理列表
     *
     * @param plan 学习计划管理
     * @return 学习计划管理集合
     */
    List<Plan> selectPlanList(Plan plan);

    /**
     * 构建学习计划集合视图对象
     * @param list 学习计划集合
     * @return 学习计划集合视图对象
     */
    List<PlanVo> buildVo(List<Plan> list);

    /**
     * 查询学习计划列表
     *
     * @param userPlanDto 查询条件
     * @return 学习计划列表
     */
    List<UserPlanVo> selectPlanList(UserPlanDto userPlanDto);

    /**
     * 创建学习计划
     * @param plan 学习计划
     * @return 结果
     */
    int createPlan(Plan plan);

    /**
     * 更新学习计划
     * @param plan 学习计划
     * @return 结果
     */
    int updatePlan(Plan plan);

    /**
     * 根据id查询学习计划
     * @param id 学习计划id
     * @return 结果
     */
    UserPlanVo getUserPlanById(Long id);

    /**
     * 自动任务：调整学习计划
     */
    void adjustPlan();
}

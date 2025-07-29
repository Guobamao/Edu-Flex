package com.eduflex.manage.goal.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.domain.vo.GoalVo;

import java.util.List;

/**
 * 学习目标管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
public interface IGoalService extends IService<Goal> {

    /**
     * 查询学习目标管理列表
     *
     * @param goal 学习目标管理
     * @return 学习目标管理集合
     */
    List<Goal> selectGoalList(Goal goal);

    /**
     * 删除学习目标
     *
     * @param id 学习目标id
     * @return 结果
     */
    int removeGoal(Long id);

    /**
     * 构建学习目标集合Vo对象
     *
     * @param list 学习目标集合
     * @return 学习目标集合Vo对象集合
     */
    List<GoalVo> buildVo(List<Goal> list);

}

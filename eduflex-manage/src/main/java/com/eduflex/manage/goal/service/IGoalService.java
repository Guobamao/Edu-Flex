package com.eduflex.manage.goal.service;

import java.util.List;
import com.eduflex.manage.goal.domain.Goal;
import com.baomidou.mybatisplus.extension.service.IService;

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
    List<Goal> selectLearningGoalList(Goal goal);
}

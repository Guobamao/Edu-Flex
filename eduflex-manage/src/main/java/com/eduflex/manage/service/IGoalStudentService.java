package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.GoalStudent;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.GoalStudentVo;

/**
 * 学习目标-学生关联Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
public interface IGoalStudentService extends IService<GoalStudent> {
    /**
     * 查询学习目标-学生关联列表
     *
     * @param goalStudent 学习目标-学生关联
     * @return 学习目标-学生关联集合
     */
    List<GoalStudentVo> selectGoalStudentList(GoalStudent goalStudent);

    /**
     * 验证是否已关联
     * @param goalStudent 学习目标-学生关联
     * @return 结果
     */
    boolean checkGoalStudentExist(GoalStudent goalStudent);
}

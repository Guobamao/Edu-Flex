package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.GoalStudent;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.dto.GoalStudentDto;
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
    List<GoalStudentVo> selectGoalStudentList(GoalStudentDto goalStudent);

    /**
     * 验证是否已关联
     * @param goalStudent 学习目标-学生关联
     * @return 结果
     */
    boolean checkGoalStudentExist(GoalStudent goalStudent);

    /**
     * 根据用户id查询关联
     * @param userId 用户ID
     * @return 结果
     */
    GoalStudent getByUserId(Long userId);

    /**
     * 根据id查询关联信息
     * @param id 关联ID
     * @return 结果
     */
    GoalStudentVo getGoalStudentVoById(Long id);
}

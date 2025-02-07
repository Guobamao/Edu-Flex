package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.GoalStudent;
import lombok.Data;

/**
 * 学习目标 - 学生关联表
 */
@Data
public class GoalStudentVo extends GoalStudent {
    private String nickName;
    private String goalName;
}

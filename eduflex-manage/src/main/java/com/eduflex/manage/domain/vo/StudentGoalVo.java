package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Student;
import lombok.Data;

/**
 * 学习目标 - 关联用户 - 学生列表
 */
@Data
public class StudentGoalVo extends StudentVo {
    // 是否已选中
    private Boolean isSelected;
}

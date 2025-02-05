package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Student;
import lombok.Data;

@Data
public class StudentGoalVo extends Student {
    // 是否已选中
    private Boolean isSelected;
}

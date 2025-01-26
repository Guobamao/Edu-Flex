package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.GoalStudent;
import lombok.Data;

@Data
public class GoalStudentVo extends GoalStudent {
    private String nickName;
    private String goalName;
}

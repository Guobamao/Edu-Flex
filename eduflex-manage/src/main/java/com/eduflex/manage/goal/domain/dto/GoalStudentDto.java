package com.eduflex.manage.goal.domain.dto;

import com.eduflex.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.List;

@Data
public class GoalStudentDto extends BaseEntity {
    private Long userId;
    private Long status;
    private List<Integer> progress;
}

package com.eduflex.manage.student.domain.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class StudentCourseDto {
    private Long userId;
    private Long courseId;
    private List<BigDecimal> progress;
    private Integer status;
}

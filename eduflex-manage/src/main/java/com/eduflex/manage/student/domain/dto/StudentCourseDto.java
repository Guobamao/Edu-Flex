package com.eduflex.manage.student.domain.dto;

import com.eduflex.manage.student.domain.StudentCourse;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class StudentCourseDto extends StudentCourse {
    private List<BigDecimal> progressList;
    private Boolean isSelected;
}

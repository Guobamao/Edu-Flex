package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.CourseGrade;
import lombok.Data;

@Data
public class CourseGradeVo extends CourseGrade {
    private String gradeName;
    private String courseName;
}

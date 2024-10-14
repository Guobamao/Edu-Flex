package com.eduflex.manage.domain.dto;

import com.eduflex.manage.domain.CourseGrade;
import lombok.Data;

@Data
public class CourseGradeDto extends CourseGrade {
    private String courseName; // 课程名称
    private String gradeName; // 班级名称
}

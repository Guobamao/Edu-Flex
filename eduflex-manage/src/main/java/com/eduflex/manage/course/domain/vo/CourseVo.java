package com.eduflex.manage.course.domain.vo;

import com.eduflex.manage.course.domain.Course;
import lombok.Data;

@Data
public class CourseVo extends Course {
    private String teacherName;
    private String categoryName;
    private Boolean isSelected;
}

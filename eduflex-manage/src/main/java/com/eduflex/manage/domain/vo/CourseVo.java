package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Course;
import lombok.Data;

@Data
public class CourseVo extends Course {
    private String teacherName;
    private String categoryName;
}

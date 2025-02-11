package com.eduflex.manage.course.domain.dto;

import com.eduflex.manage.course.domain.Course;
import lombok.Data;

@Data
public class CourseDto extends Course {
    private Long routeId;
}

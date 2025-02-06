package com.eduflex.manage.domain.dto;

import com.eduflex.manage.domain.Course;
import lombok.Data;

@Data
public class CourseDto extends Course {
    private Long routeId;
}

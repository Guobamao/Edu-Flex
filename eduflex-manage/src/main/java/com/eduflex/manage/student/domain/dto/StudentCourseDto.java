package com.eduflex.manage.student.domain.dto;

import com.eduflex.manage.student.domain.StudentCourse;
import lombok.Data;

import java.util.List;

@Data
public class StudentCourseDto extends StudentCourse {

    private List<Integer> progressList;
    private Boolean isSelected;
}

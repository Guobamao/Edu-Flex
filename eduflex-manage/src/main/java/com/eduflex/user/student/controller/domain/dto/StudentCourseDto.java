package com.eduflex.user.student.controller.domain.dto;

import com.eduflex.manage.student.domain.StudentCourse;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("UserStudentCourseDto")
public class StudentCourseDto extends StudentCourse {
    private Boolean isSelected;
}

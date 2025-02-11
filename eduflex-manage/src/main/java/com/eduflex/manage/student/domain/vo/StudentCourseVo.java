package com.eduflex.manage.student.domain.vo;

import com.eduflex.manage.student.domain.StudentCourse;
import lombok.Data;

/**
 * 学生选课视图对象
 */
@Data
public class StudentCourseVo extends StudentCourse {
    private String userName;
    private String nickName;
    private String courseName;
}

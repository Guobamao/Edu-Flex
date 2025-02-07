package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.StudentCourse;
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

package com.eduflex.manage.course.domain.vo;

import com.eduflex.manage.course.domain.Course;
import lombok.Data;

@Data
public class CourseVo extends Course {
    private String teacherName;
    private String categoryName;

    // 学习目标 - 是否已被选
    private Boolean isSelected;

    // 用户端 - 选课人数
    private Integer selectedNum;

    // 用户端 - 课程节数（课程资源 - 视频数）
    private Integer videoNum;

    // 用户端 - 课程总时长（课程资源 - 视频时长）
    private Integer videoTime;
}

package com.eduflex.manage.course.domain.vo;

import com.eduflex.manage.course.domain.Course;
import lombok.Data;

/**
 * 课程管理视图对象
 * @author Administrator
 */
@Data
public class CourseVo extends Course {
    private String teacherName;
    private String categoryName;

    // 选课人数
    private Integer selectedNum;

    // 综合评分
    private Double avgScore;

    // 资源数
    private Integer resourceNum;

    private Boolean isSelected;

    // 用户端 - 课程节数（课程资源 - 视频数）
    private Integer videoNum;

    // 用户端 - 课程总时长（课程资源 - 视频时长）
    private Integer videoTime;
}

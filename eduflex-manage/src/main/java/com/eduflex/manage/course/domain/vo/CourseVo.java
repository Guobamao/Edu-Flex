package com.eduflex.manage.course.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.course.domain.Course;
import lombok.Data;

/**
 * 课程管理视图对象
 * @author Administrator
 */
@Data
public class CourseVo extends Course {
    @Excel(name = "教师名称")
    private String teacherName;
    @Excel(name = "课程方向")
    private String directionName;
    @Excel(name = "课程分类")
    private String categoryName;

    // 选课人数
    @Excel(name = "选课人数")
    private Integer selectedNum;

    // 综合评分
    @Excel(name = "综合评分")
    private Double avgScore;

    // 资源数
    @Excel(name = "资源数")
    private Integer resourceNum;

    private Boolean isSelected;

    // 用户端 - 课程节数（课程资源 - 视频数）
    private Integer videoNum;

    // 用户端 - 课程总时长（课程资源 - 视频时长）
    private Integer videoTime;
}

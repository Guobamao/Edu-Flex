package com.eduflex.manage.course.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.course.domain.Course;
import lombok.Data;

/**
 * 课程管理视图对象
 *
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

    // 评论数
    @Excel(name = "评论数")
    private Integer commentNum;

    // 评价数
    @Excel(name = "评价数")
    private Integer evaluationNum;

    // 考试数
    @Excel(name = "考试数")
    private Integer examNum;

    // 作业数
    @Excel(name = "作业数")
    private Integer homeworkNum;

    // 试卷数
    @Excel(name = "试卷数")
    private Integer paperNum;

    // 题库数
    @Excel(name = "题库数")
    private Integer repoNum;

    private Boolean isSelected;

    // 用户端 - 课程节数（课程资源 - 视频数）
    private Integer videoNum;

    // 用户端 - 课程总时长（课程资源 - 视频时长）
    private Integer videoTime;
}

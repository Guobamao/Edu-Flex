package com.eduflex.manage.student.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 学生选课视图对象
 */
@Data
public class StudentCourseVo extends BaseEntity {
    private Long id;

    @Excel(name = "登录名称")
    private String userName;
    @Excel(name = "学生姓名")
    private String nickName;

    private Long courseId;

    @Excel(name = "课程名称")
    private String courseName;
    private Long cover;

    @Excel(name = "学习进度(%)", suffix = "%")
    private Integer progress;

    @Excel(name = "状态", readConverterExp = "0=未开始,1=进行中,2=已完成")
    private Integer status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "完成时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date finishTime;
}
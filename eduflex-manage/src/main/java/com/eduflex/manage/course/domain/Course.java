package com.eduflex.manage.course.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 课程管理对象 tb_course
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_course")
public class Course extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课程ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String name;

    /** 课程描述 */
    private String description;

    /** 方向ID */
    private Long directionId;

    /** 分类ID */
    private Long categoryId;

    /** 任课老师ID */
    @Excel(name = "任课老师ID")
    private Long teacherId;

    /** 课程封面 */
    private Long cover;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 课程状态(0=未开始 1=进行中 2=已结束) */
    @Excel(name = "课程状态(0=未开始 1=进行中 2=已结束)")
    private Integer status;
}

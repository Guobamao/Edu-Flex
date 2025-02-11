package com.eduflex.manage.exam.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 考试管理对象 tb_exam
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_exam")
public class Exam extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 关联课程ID
     */
    @Excel(name = "关联课程ID")
    private Long courseId;

    /**
     * 关联试卷ID
     */
    @Excel(name = "关联试卷ID")
    private Long paperId;

    /**
     * 考试名称
     */
    @Excel(name = "考试名称")
    private String name;

    /**
     * 总分数
     */
    @Excel(name = "总分数")
    private Integer totalScore;

    /**
     * 考试状态(0-未开始 1-进行中 2-已结束)
     */
    @Excel(name = "考试状态")
    private Integer status;

    /**
     * 是否发布(0-否 1-是)
     */
    @Excel(name = "是否发布(0-否 1-是)")
    private Integer published;

    /**
     * 及格分数
     */
    @Excel(name = "及格分数")
    private Integer passScore;

    /**
     * 考试时长(分钟)
     */
    @Excel(name = "考试时长(分钟)")
    private Integer duration;

    /**
     * 是否限时(0-否 1-是)
     */
    @Excel(name = "是否限时(0-否 1-是)")
    private Integer limited;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;
}

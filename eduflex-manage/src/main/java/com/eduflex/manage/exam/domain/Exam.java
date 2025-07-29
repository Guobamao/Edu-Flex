package com.eduflex.manage.exam.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

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
    private Long courseId;

    /**
     * 关联试卷ID
     */
    private Long paperId;

    /**
     * 考试名称
     */
    @Excel(name = "考试名称", sort = 2)
    private String name;

    /**
     * 总分数
     */
    @Excel(name = "总分数", suffix = "分", sort = 4)
    private Integer totalScore;

    /**
     * 考试状态(0-未开始 1-进行中 2-已结束)
     */
    @Excel(name = "考试状态", readConverterExp = "0=未开始,1=进行中,2=已结束", sort = 6, dictType = "common_status", comboReadDict = true)
    private Integer status;

    /**
     * 是否发布(0-否 1-是)
     */
    @Excel(name = "是否发布", sort = 7, dictType = "exam_publish_status", comboReadDict = true)
    private Integer published;

    /**
     * 及格分数
     */
    @Excel(name = "及格分数", suffix = "分", sort = 5)
    private Integer passScore;

    /**
     * 考试时长(分钟)
     */
    @Excel(name = "考试时长", suffix = "分钟", sort = 8)
    private Integer duration;

    /**
     * 是否限时(0-否 1-是)
     */
    @Excel(name = "是否限时", readConverterExp = "0=否,1=是", sort = 9, combo = {"是", "否"})
    private Integer limited;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss", sort = 10)
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss", sort = 11)
    private Date endTime;
}

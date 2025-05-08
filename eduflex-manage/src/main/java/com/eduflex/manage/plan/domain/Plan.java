package com.eduflex.manage.plan.domain;

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
 * 学习计划管理对象 tb_plan
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_plan")
public class Plan extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 学习目标ID
     */
    private Long goalId;

    /**
     * 计划标题
     */
    @Excel(name = "计划标题", sort = 4)
    private String title;

    /**
     * 计划内容
     */
    @Excel(name = "计划内容", sort = 5)
    private String content;

    /**
     * 开始日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始日期", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /**
     * 结束日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束日期", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /**
     * 计划状态（0-未开始 1-进行中 2-已完成）
     */
    @Excel(name = "计划状态", sort = 6, dictType = "common_status", comboReadDict = true)
    private Integer status;

    /**
     * 任务提醒时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "任务提醒时间", sort = 7, width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date reminderTime;

    /**
     * 计划被调整次数
     */
    @Excel(name = "计划被调整次数", sort = 8)
    private Integer adjustCount;
}

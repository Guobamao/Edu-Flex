package com.eduflex.user.plan.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 用户学习计划视图对象
 *
 * @author 林煜鋒
 * @date 2025-03-12
 */
@Data
public class UserPlanVo {
    private Long id;
    private Long goalId;
    private String goalName;
    private String title;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    /**
     * 计划状态（0-未开始 1-进行中 2-已完成）
     */
    private Integer status;

    /**
     * 任务提醒时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date reminderTime;

    /**
     * 计划被调整次数
     */
    private Integer adjustCount;
}

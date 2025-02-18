package com.eduflex.user.homework.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class HomeworkVo {
    // 作业ID
    private Long homeworkId;
    // 课程名称
    private String courseName;
    // 作业标题
    private String title;
    // 作业内容
    private String content;
    // 截止日期
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deadline;
    // 提交时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date submitTime;
    // 提交状态
    private Integer status;
}

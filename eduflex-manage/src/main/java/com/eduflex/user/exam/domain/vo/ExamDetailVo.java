package com.eduflex.user.exam.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ExamDetailVo {
    // 考试名称
    private String name;
    // 总分数
    private Integer totalScore;
    // 及格分数
    private Integer passScore;
    // 是否限时（0-否 1-是）
    private Integer limited;
    // 开始时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    // 结束时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    // 考试时长
    private Integer duration;
}

package com.eduflex.user.exam.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("UserExamVo")
public class ExamVo {
    // 考试ID
    private Long examId;
    // 课程ID
    private Long courseId;
    // 课程名称
    private String courseName;
    // 考试名称
    private String examName;
    // 总分数
    private Integer totalScore;
    // 及格分数
    private Integer passScore;
    // 考试时长
    private Integer duration;
    // 是否限时
    private Integer limited;
    // 开始时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    // 结束时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    // 考试状态(0-未开始 1-进行中 2-已结束)
    private Integer status;
    // 提交状态(0-未开始 1-进行中 2-已提交)
    private Integer submitStatus;
    // 提交时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date submitTime;
    // 记录ID
    private Long recordId;
    // 是否通过
    private Integer passed;
    // 最终分数
    private Integer finalScore;
}

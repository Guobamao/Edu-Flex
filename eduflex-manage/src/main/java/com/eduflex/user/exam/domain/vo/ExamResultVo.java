package com.eduflex.user.exam.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 考试结果 Vo
 */
@Data
public class ExamResultVo {
    // 用户名
    private String userName;
    // 用户昵称
    private String nickName;
    // 考试名称
    private String examName;
    // 考试用时
    private Integer duration;
    // 考试分数
    private Integer score;
    // 考试状态
    private Integer status;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    // 题目列表
    private List<ExamResultQuestionVo> questionList;
}

package com.eduflex.user.exam.domain.vo;

import lombok.Data;

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
    // 题目列表
    private List<ExamResultQuestionVo> questionList;
}

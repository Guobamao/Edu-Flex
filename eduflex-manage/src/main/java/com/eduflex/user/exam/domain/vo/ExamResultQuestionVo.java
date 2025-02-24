package com.eduflex.user.exam.domain.vo;

import lombok.Data;

/**
 * 考试结果题目 VO
 */
@Data
public class ExamResultQuestionVo {
    // 题目ID
    private Long id;
    // 题目内容
    private String title;
    // 选项
    private String options;
    // 排序
    private Integer orderNum;
    // 题目分数
    private Integer score;
    // 获得分
    private Integer getScore;
    // 已填答案
    private String answer;
    // 正确答案
    private String rightAnswer;
    // 是否答对
    private Integer isRight;
    // 题目类型
    private Integer type;
    // 已批阅 - 主观题（填空 / 简答）
    private Integer isChecked;
}

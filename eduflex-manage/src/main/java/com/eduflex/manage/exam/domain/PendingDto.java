package com.eduflex.manage.exam.domain;

import lombok.Data;

/**
 * 批阅试卷题目传输对象
 */
@Data
public class PendingDto {

    // 考试记录ID
    private Long recordId;
    // 题目ID
    private Long questionId;
    // 得分
    private Integer pendingScore;
}

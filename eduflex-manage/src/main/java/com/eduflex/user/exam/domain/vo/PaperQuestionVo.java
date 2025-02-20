package com.eduflex.user.exam.domain.vo;

import lombok.Data;
import org.apache.ibatis.type.Alias;

/**
 * 用户端 - 考试试卷题目Vo
 */
@Data
@Alias("UserPaperQuestionVo")
public class PaperQuestionVo {
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
    // 题目类型
    private Integer type;
}

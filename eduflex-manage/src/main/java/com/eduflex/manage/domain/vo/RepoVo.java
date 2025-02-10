package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Repo;
import lombok.Data;

@Data
public class RepoVo extends Repo {
    private String courseName;

    // 单选题数量
    private Long singleChoiceCount;
    // 多选题数量
    private Long multipleChoiceCount;
    // 判断题数量
    private Long judgeCount;
    // 填空题数量
    private Long blankCount;
    // 简答题数量
    private Long shortAnswerCount;
}

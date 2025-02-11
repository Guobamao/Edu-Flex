package com.eduflex.manage.repo.domain.vo;

import com.eduflex.manage.repo.domain.Repo;
import lombok.Data;

@Data
public class RepoVo extends Repo {
    private String courseName;

    // 单选题数量
    private Integer singleChoiceCount;
    // 多选题数量
    private Integer multipleChoiceCount;
    // 判断题数量
    private Integer judgeCount;
    // 填空题数量
    private Integer blankCount;
    // 简答题数量
    private Integer shortAnswerCount;
}

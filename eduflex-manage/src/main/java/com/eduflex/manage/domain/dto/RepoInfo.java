package com.eduflex.manage.domain.dto;

import lombok.Data;

@Data
public class RepoInfo {
    private Long repoId;
    private Integer singleChoiceCount;
    private Integer singleChoiceScore;
    private Integer multipleChoiceCount;
    private Integer multipleChoiceScore;
    private Integer judgeCount;
    private Integer judgeScore;
    private Integer blankCount;
    private Integer blankScore;
    private Integer shortAnswerCount;
    private Integer shortAnswerScore;
}

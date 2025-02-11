package com.eduflex.manage.question.domain.vo;

import com.eduflex.manage.question.domain.Question;
import lombok.Data;

@Data
public class QuestionVo extends Question {
    private String repoName;
}

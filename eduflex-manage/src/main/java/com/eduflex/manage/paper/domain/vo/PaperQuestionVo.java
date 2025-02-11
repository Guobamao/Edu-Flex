package com.eduflex.manage.paper.domain.vo;

import com.eduflex.manage.question.domain.Question;
import lombok.Data;

@Data
public class PaperQuestionVo extends Question {
    private Integer orderNum;
}

package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Question;
import lombok.Data;

@Data
public class PaperQuestionVo extends Question {
    private Integer orderNum;
}

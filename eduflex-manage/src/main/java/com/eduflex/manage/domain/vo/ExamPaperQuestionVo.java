package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.ExamPaperQuestion;
import lombok.Data;

@Data
public class ExamPaperQuestionVo extends ExamPaperQuestion {
    private String title;
    private Long type;
    private String options;
    private String answer;
    private String analysis;
    private Integer difficulty;
}

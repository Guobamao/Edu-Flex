package com.eduflex.manage.question.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.question.domain.Question;
import lombok.Data;

@Data
public class QuestionVo extends Question {
    @Excel(name = "题库名称", sort = 1)
    private String repoName;
}

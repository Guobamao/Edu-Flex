package com.eduflex.manage.question.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.common.annotation.Excels;
import com.eduflex.manage.question.domain.Option;
import lombok.Data;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

@Data
public class QuestionExportAndImportVo {
    @Excel(name = "题库名称", sort = 1, type = Excel.Type.EXPORT)
    private String repoName;

    @Excel(name = "题目内容", align = HorizontalAlignment.LEFT, width = 30, sort = 2)
    private String title;

    @Excel(name = "题目类型", dictType = "question_type", comboReadDict = true, sort = 3)
    private Integer type;

    @Excels({
            @Excel(name = "选项A", targetAttr = "optionA", sort = 4),
            @Excel(name = "选项B", targetAttr = "optionB", sort = 5),
            @Excel(name = "选项C", targetAttr = "optionC", sort = 6),
            @Excel(name = "选项D", targetAttr = "optionD", sort = 7)
    })
    private Option options = new Option();

    @Excel(name = "正确答案(逗号分隔)", sort = 8)
    private String answer;

    @Excel(name = "答案解析", align = HorizontalAlignment.LEFT, width = 30, sort = 9)
    private String analysis;

    @Excel(name = "困难程度", dictType = "question_difficulty", comboReadDict = true, sort = 10)
    private Integer difficulty;
}

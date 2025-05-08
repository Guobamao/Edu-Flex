package com.eduflex.manage.exam.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.exam.domain.Exam;
import lombok.Data;

@Data
public class ExamVo extends Exam {
    @Excel(name = "课程名称", sort = 1)
    private String courseName;
    @Excel(name = "试卷名称", sort = 3)
    private String paperName;
}

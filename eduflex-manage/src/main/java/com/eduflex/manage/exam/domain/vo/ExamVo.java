package com.eduflex.manage.exam.domain.vo;

import com.eduflex.manage.exam.domain.Exam;
import lombok.Data;

@Data
public class ExamVo extends Exam {
    private String courseName;
    private String paperName;
}

package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Exam;
import lombok.Data;

@Data
public class ExamVo extends Exam {
    private String courseName;
    private String paperName;
}

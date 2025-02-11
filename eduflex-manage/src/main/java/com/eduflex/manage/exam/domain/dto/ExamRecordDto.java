package com.eduflex.manage.exam.domain.dto;

import com.eduflex.manage.exam.domain.ExamRecord;
import lombok.Data;

@Data
public class ExamRecordDto extends ExamRecord {
    // 关键词
    private String searchValue;
}

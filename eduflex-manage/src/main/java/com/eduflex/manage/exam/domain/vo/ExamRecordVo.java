package com.eduflex.manage.exam.domain.vo;

import com.eduflex.manage.exam.domain.ExamRecord;
import lombok.Data;

@Data
public class ExamRecordVo extends ExamRecord {
    private String userName;
    private String nickName;
    private String examName;
}

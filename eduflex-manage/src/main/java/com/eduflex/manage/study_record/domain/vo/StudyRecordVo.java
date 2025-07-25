package com.eduflex.manage.study_record.domain.vo;

import com.eduflex.manage.study_record.domain.StudyRecord;
import lombok.Data;

@Data
public class StudyRecordVo extends StudyRecord {

    private String nickName;
    private String userName;
    private String courseName;
}

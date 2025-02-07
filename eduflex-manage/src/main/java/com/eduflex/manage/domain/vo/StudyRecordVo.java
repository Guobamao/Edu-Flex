package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.StudyRecord;
import lombok.Data;

@Data
public class StudyRecordVo extends StudyRecord {
    private String nickName;
    private String userName;
    private String courseName;
}

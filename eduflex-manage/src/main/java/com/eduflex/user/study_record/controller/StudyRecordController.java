package com.eduflex.user.study_record.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.eduflex.user.study_record.domain.dto.StudyRecordDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "UserStudyRecordController")
@RequestMapping("/user/record")
public class StudyRecordController extends BaseController {

    @Autowired
    private IStudyRecordService studyRecordService;

    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping("/save")
    public AjaxResult save(@RequestBody StudyRecordDto studyRecordDto) {
        studyRecordDto.setUserId(getUserId());
        return success(studyRecordService.saveStudyRecord(studyRecordDto));
    }
}

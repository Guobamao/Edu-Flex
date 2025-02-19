package com.eduflex.user.exam.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.exam.service.IExamRecordService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController(value = "UserExamController")
@RequestMapping("/user/exam")
public class ExamController extends BaseController {

    @Autowired
    private IExamRecordService examRecordService;

    @GetMapping("/list")
    public TableDataInfo list(ExamDto examDto) {
        startPage();
        examDto.setUserId(getUserId());
        List<ExamVo> list = examRecordService.selectExamRecordList(examDto);
        return getDataTable(list);
    }
}

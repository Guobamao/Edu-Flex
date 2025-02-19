package com.eduflex.user.exam.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.service.IExamRecordService;
import com.eduflex.manage.exam.service.IExamService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamDetailVo;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController(value = "UserExamController")
@RequestMapping("/user/exam")
public class ExamController extends BaseController {

    @Autowired
    private IExamService examService;

    @Autowired
    private IExamRecordService examRecordService;

    @GetMapping("/list")
    public TableDataInfo list(ExamDto examDto) {
        startPage();
        examDto.setUserId(getUserId());
        List<ExamVo> list = examRecordService.selectExamRecordList(examDto);
        return getDataTable(list);
    }

    @GetMapping("/{id}")
    public AjaxResult getExamInfo(@PathVariable("id") Long id) {
        Exam exam = examService.getById(id);
        ExamDetailVo examDetailVo = new ExamDetailVo();
        BeanUtils.copyProperties(exam, examDetailVo);

        return success(examDetailVo);
    }

    @GetMapping("/create")
    public AjaxResult createExam(ExamDto examDto) throws SchedulerException, TaskException {
        examDto.setUserId(getUserId());
        return success(examRecordService.createExam(examDto));
    }
}

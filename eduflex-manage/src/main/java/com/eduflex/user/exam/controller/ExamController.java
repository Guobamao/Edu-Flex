package com.eduflex.user.exam.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.service.IExamRecordService;
import com.eduflex.manage.exam.service.IExamService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamDetailVo;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "UserExamController")
@RequestMapping("/user/exam")
public class ExamController extends BaseController {

    @Autowired
    private IExamService examService;

    @Autowired
    private IExamRecordService examRecordService;

    /**
     * 获取考试列表
     * @param examDto 查询条件
     * @return 考试列表
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(ExamDto examDto) {
        startPage();
        examDto.setUserId(getUserId());
        List<ExamVo> list = examRecordService.selectExamRecordList(examDto);
        return getDataTable(list);
    }

    /**
     * 获取考试详情
     * @param id 考试ID
     * @return 考试详情
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/{id}")
    public AjaxResult getExamInfo(@PathVariable("id") Long id) {
        Exam exam = examService.getById(id);
        ExamDetailVo examDetailVo = new ExamDetailVo();
        BeanUtils.copyProperties(exam, examDetailVo);

        return success(examDetailVo);
    }

    /**
     * 创建考试
     * @param examDto 创建条件
     * @return 结果
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/create")
    public AjaxResult createExam(ExamDto examDto) {
        examDto.setUserId(getUserId());
        return success(examRecordService.createExam(examDto));
    }

    /**
     * 获取考试记录详情
     * @param id 考试记录ID
     * @return 考试记录详情
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/detail/{id}")
    public AjaxResult getExamRecordDetail(@PathVariable("id") Long id) {
        return success(examRecordService.selectExamRecordById(id));
    }
}

package com.eduflex.user.exam.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.service.IExamAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "UserExamAnswerController")
@RequestMapping("/user/exam/answer")
public class ExamAnswerController extends BaseController {

    @Autowired
    private IExamAnswerService examAnswerService;

    /**
     * 提交答案
     *
     * @param examAnswer 答案信息
     * @return 结果
     */
    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ExamAnswer examAnswer) {
        return success(examAnswerService.insertAnswer(examAnswer));
    }
}

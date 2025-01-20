package com.eduflex.manage.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.vo.ExamPaperQuestionVo;

import java.util.List;

/**
 * 试卷题目 Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-20
 */
public interface IExamPaperQuestionService extends IService<ExamPaperQuestion> {
    List<ExamPaperQuestionVo> selectQuestionByPaperId(Long id);
}

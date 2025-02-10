package com.eduflex.manage.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.Question;

import java.util.List;
import java.util.Map;

/**
 * 试卷题目 Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-20
 */
public interface IExamPaperQuestionService extends IService<ExamPaperQuestion> {
    Map<Integer, List<Question>> selectQuestionByPaperId(Long id);
}

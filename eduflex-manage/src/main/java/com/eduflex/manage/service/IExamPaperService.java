package com.eduflex.manage.service;

import java.util.List;
import java.util.Map;

import com.eduflex.manage.domain.ExamPaper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.Question;
import com.eduflex.manage.domain.dto.PaperDto;
import com.eduflex.manage.domain.dto.PaperQuestionDto;
import com.eduflex.manage.domain.vo.ExamPaperVo;

/**
 * 试卷管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IExamPaperService extends IService<ExamPaper> {
    /**
     * 查询试卷管理列表
     *
     * @param examPaper 试卷管理
     * @return 试卷管理集合
     */
    List<ExamPaperVo> selectExamPaperList(ExamPaper examPaper);

    /**
     * 组卷
     *
     * @param paperDto 试卷ID + 题库信息
     * @return 组卷题目列表
     */
    Map<Integer, List<Question>> generateQuestions(PaperDto paperDto);

    /**
     * 组卷
     *
     * @param paperQuestionDto 试题列表
     * @return 组卷结果
     */
    boolean composePaper(PaperQuestionDto paperQuestionDto);
}

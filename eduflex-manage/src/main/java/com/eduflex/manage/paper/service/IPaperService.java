package com.eduflex.manage.paper.service;

import java.util.List;
import java.util.Map;

import com.eduflex.manage.paper.domain.Paper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.paper.domain.dto.PaperDto;
import com.eduflex.manage.paper.domain.dto.PaperQuestionDto;
import com.eduflex.manage.paper.domain.vo.PaperQuestionVo;
import com.eduflex.manage.paper.domain.vo.PaperVo;

/**
 * 试卷管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IPaperService extends IService<Paper> {
    /**
     * 查询试卷管理列表
     *
     * @param paper 试卷管理
     * @return 试卷管理集合
     */
    List<PaperVo> selectExamPaperList(Paper paper);

    /**
     * 组卷
     *
     * @param paperDto 试卷ID + 题库信息
     * @return 组卷题目列表
     */
    Map<Integer, List<PaperQuestionVo>> generateQuestions(PaperDto paperDto);

    /**
     * 组卷
     *
     * @param paperQuestionDto 试题列表
     * @return 组卷结果
     */
    boolean composePaper(PaperQuestionDto paperQuestionDto);
}

package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.ExamQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 题目管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IExamQuestionService extends IService<ExamQuestion> {
    /**
     * 查询题目管理列表
     *
     * @param examQuestion 题目管理
     * @return 题目管理集合
     */
    List<ExamQuestion> selectExamQuestionList(ExamQuestion examQuestion);

}

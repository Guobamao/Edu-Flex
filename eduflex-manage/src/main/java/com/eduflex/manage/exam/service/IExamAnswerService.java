package com.eduflex.manage.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.exam.domain.ExamAnswer;

import java.util.List;

/**
 * 考试答案记录 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
public interface IExamAnswerService extends IService<ExamAnswer> {

    /**
     * 查询考试答案记录列表
     *
     * @param examAnswer 考试答案记录
     * @return 考试答案记录集合
     */
    List<ExamAnswer> selectExamAnswerList(ExamAnswer examAnswer);

    /**
     * 提交答案
     *
     * @param examAnswer 答案信息
     * @return 结果
     */
    String insertAnswer(ExamAnswer examAnswer);
}

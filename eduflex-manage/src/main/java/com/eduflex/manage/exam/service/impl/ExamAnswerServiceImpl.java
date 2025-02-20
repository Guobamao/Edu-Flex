package com.eduflex.manage.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import com.eduflex.manage.exam.mapper.ExamAnswerMapper;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.service.IExamAnswerService;

/**
 * 考试答案记录Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@Service
public class ExamAnswerServiceImpl extends ServiceImpl<ExamAnswerMapper, ExamAnswer> implements IExamAnswerService {

    @Override
    public List<ExamAnswer> selectExamAnswerList(ExamAnswer examAnswer) {
        LambdaQueryWrapper<ExamAnswer> wrapper = new LambdaQueryWrapper<ExamAnswer>()
                .eq(examAnswer.getRecordId() != null, ExamAnswer::getRecordId, examAnswer.getRecordId());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public String insertAnswer(ExamAnswer examAnswer) {
        LambdaQueryWrapper<ExamAnswer> wrapper = new LambdaQueryWrapper<ExamAnswer>()
                .eq(ExamAnswer::getRecordId, examAnswer.getRecordId())
                .eq(ExamAnswer::getQuestionId, examAnswer.getQuestionId());

        if (baseMapper.selectOne(wrapper) == null) {
            baseMapper.insert(examAnswer);
            return "success";
        } else {
            baseMapper.update(examAnswer, wrapper);
            return "success";
        }
    }
}

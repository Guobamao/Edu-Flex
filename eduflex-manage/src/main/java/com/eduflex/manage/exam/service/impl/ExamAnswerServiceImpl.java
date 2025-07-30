package com.eduflex.manage.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.manage.exam.mapper.ExamAnswerMapper;
import com.eduflex.manage.exam.service.IExamAnswerService;
import com.eduflex.manage.exam.service.IExamRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        IExamRecordService examRecordService = SpringUtils.getBean(IExamRecordService.class);
        LambdaQueryWrapper<ExamAnswer> wrapper = new LambdaQueryWrapper<ExamAnswer>()
                .eq(ExamAnswer::getRecordId, examAnswer.getRecordId())
                .eq(ExamAnswer::getQuestionId, examAnswer.getQuestionId());

        if (baseMapper.selectOne(wrapper) == null) {
            baseMapper.insert(examAnswer);
        } else {
            baseMapper.update(examAnswer, wrapper);
        }

        // 计算考试用时
        ExamRecord examRecord = examRecordService.getById(examAnswer.getRecordId());
        int i = (int) ((System.currentTimeMillis() - examRecord.getCreateTime().getTime()) / 1000);
        LambdaUpdateWrapper<ExamRecord> set = new LambdaUpdateWrapper<ExamRecord>()
                .eq(ExamRecord::getId, examRecord.getId())
                .set(ExamRecord::getDuration, i);
        examRecordService.update(set);

        return "success";
    }
}

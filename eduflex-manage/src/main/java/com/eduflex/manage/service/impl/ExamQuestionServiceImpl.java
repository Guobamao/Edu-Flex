package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.ExamQuestionMapper;
import com.eduflex.manage.domain.ExamQuestion;
import com.eduflex.manage.service.IExamQuestionService;

/**
 * 题目管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class ExamQuestionServiceImpl extends ServiceImpl<ExamQuestionMapper, ExamQuestion> implements IExamQuestionService {

    @Override
    public List<ExamQuestion> selectExamQuestionList(ExamQuestion examQuestion) {
        LambdaQueryWrapper<ExamQuestion> wrapper = new LambdaQueryWrapper<ExamQuestion>()
                .like(StrUtil.isNotBlank(examQuestion.getTitle()), ExamQuestion::getTitle, examQuestion.getTitle())
                .eq(examQuestion.getType() != null, ExamQuestion::getType, examQuestion.getType())
                .eq(examQuestion.getDifficulty() != null, ExamQuestion::getDifficulty, examQuestion.getDifficulty())
                .eq(examQuestion.getCourseId() != null, ExamQuestion::getCourseId, examQuestion.getCourseId());

        return baseMapper.selectList(wrapper);
    }
}

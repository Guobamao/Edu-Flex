package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import com.eduflex.manage.domain.Knowledge;
import com.eduflex.manage.service.IKnowledgeService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private IKnowledgeService knowledgeService;

    @Override
    public List<ExamQuestion> selectExamQuestionList(ExamQuestion examQuestion) {
        LambdaQueryWrapper<ExamQuestion> wrapper = new LambdaQueryWrapper<ExamQuestion>()
                .like(StrUtil.isNotBlank(examQuestion.getTitle()), ExamQuestion::getTitle, examQuestion.getTitle())
                .eq(examQuestion.getType() != null, ExamQuestion::getType, examQuestion.getType())
                .eq(examQuestion.getCourseId() != null, ExamQuestion::getCourseId, examQuestion.getCourseId());

        if (examQuestion.getKnowledgeId() != null) {
            // 获取该知识点下的所有子项，包括自身
            List<Long> knowledgeIds = knowledgeService.list().stream()
                    .filter(knowledge -> knowledge.getId().equals(examQuestion.getKnowledgeId()) || knowledge.getAncestors().contains(examQuestion.getKnowledgeId().toString()))
                    .map(Knowledge::getId).toList();
            wrapper.in(ExamQuestion::getKnowledgeId, knowledgeIds);
        }
        return baseMapper.selectList(wrapper);
    }
}

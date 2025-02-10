package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.Question;
import com.eduflex.manage.mapper.ExamPaperQuestionMapper;
import com.eduflex.manage.service.IExamPaperQuestionService;
import com.eduflex.manage.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 试卷题目 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-20
 */
@Service
public class ExamPaperQuestionServiceImpl extends ServiceImpl<ExamPaperQuestionMapper, ExamPaperQuestion> implements IExamPaperQuestionService {

    @Autowired
    private IQuestionService examQuestionService;

    @Override
    public Map<Integer, List<Question>> selectQuestionByPaperId(Long id) {
        LambdaQueryWrapper<ExamPaperQuestion> wrapper = new LambdaQueryWrapper<ExamPaperQuestion>()
                .eq(ExamPaperQuestion::getPaperId, id);

        List<ExamPaperQuestion> examPaperQuestions = baseMapper.selectList(wrapper);

        List<Question> questionList = new ArrayList<>();
        examPaperQuestions.forEach(v -> {
            Question question = examQuestionService.getById(v.getQuestionId());
            questionList.add(question);
        });

        return questionList.stream()
                .collect(Collectors.groupingBy(Question::getType));
    }
}

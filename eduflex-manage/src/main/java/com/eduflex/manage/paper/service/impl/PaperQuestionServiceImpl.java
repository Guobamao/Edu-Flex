package com.eduflex.manage.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.paper.domain.PaperQuestion;
import com.eduflex.manage.question.domain.Question;
import com.eduflex.manage.paper.domain.vo.PaperQuestionVo;
import com.eduflex.manage.paper.mapper.PaperQuestionMapper;
import com.eduflex.manage.paper.service.IPaperQuestionService;
import com.eduflex.manage.question.service.IQuestionService;
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
public class PaperQuestionServiceImpl extends ServiceImpl<PaperQuestionMapper, PaperQuestion> implements IPaperQuestionService {

    @Autowired
    private IQuestionService examQuestionService;

    @Override
    public Map<Integer, List<PaperQuestionVo>> selectQuestionByPaperId(Long id) {
        LambdaQueryWrapper<PaperQuestion> wrapper = new LambdaQueryWrapper<PaperQuestion>()
                .eq(PaperQuestion::getPaperId, id);

        List<PaperQuestion> paperQuestions = baseMapper.selectList(wrapper);

        List<PaperQuestionVo> questionList = new ArrayList<>();


        paperQuestions.forEach(v -> {
            Question question = examQuestionService.getById(v.getQuestionId());
            PaperQuestionVo paperQuestionVo = new PaperQuestionVo();
            BeanUtils.copyProperties(question, paperQuestionVo);
            paperQuestionVo.setOrderNum(v.getOrderNum());
            questionList.add(paperQuestionVo);
        });

        return questionList.stream()
                .collect(Collectors.groupingBy(Question::getType));
    }
}

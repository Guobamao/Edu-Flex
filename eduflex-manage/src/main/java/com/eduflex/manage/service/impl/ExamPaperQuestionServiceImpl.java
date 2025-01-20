package com.eduflex.manage.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.ExamQuestion;
import com.eduflex.manage.domain.vo.ExamPaperQuestionVo;
import com.eduflex.manage.mapper.ExamPaperQuestionMapper;
import com.eduflex.manage.service.IExamPaperQuestionService;
import com.eduflex.manage.service.IExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * 试卷题目 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-20
 */
@Service
public class ExamPaperQuestionServiceImpl extends ServiceImpl<ExamPaperQuestionMapper, ExamPaperQuestion> implements IExamPaperQuestionService {

    @Autowired
    private IExamQuestionService examQuestionService;

    @Override
    public List<ExamPaperQuestionVo> selectQuestionByPaperId(Long id) {
        LambdaQueryWrapper<ExamPaperQuestion> wrapper = new LambdaQueryWrapper<ExamPaperQuestion>()
                .eq(ExamPaperQuestion::getPaperId, id);

        List<ExamPaperQuestion> examPaperQuestions = baseMapper.selectList(wrapper);

        List<ExamPaperQuestionVo> examPaperQuestionVos = new ArrayList<>();
        examPaperQuestions.forEach(v -> {
            ExamQuestion question = examQuestionService.getById(v.getQuestionId());
            ExamPaperQuestionVo examPaperQuestionVo = new ExamPaperQuestionVo();
            BeanUtil.copyProperties(v, examPaperQuestionVo);
            BeanUtil.copyProperties(question, examPaperQuestionVo);
            examPaperQuestionVos.add(examPaperQuestionVo);
        });

        // 排序
        examPaperQuestionVos.sort(Comparator.comparing(ExamPaperQuestion::getOrderNum));
        return examPaperQuestionVos;
    }
}

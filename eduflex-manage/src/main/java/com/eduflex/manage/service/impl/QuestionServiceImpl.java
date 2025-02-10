package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.domain.vo.QuestionVo;
import com.eduflex.manage.service.IRepoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.QuestionMapper;
import com.eduflex.manage.domain.Question;
import com.eduflex.manage.service.IQuestionService;

/**
 * 题目管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {

    @Autowired
    private IRepoService repoService;

    @Override
    public List<QuestionVo> selectExamQuestionList(Question question) {
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                .like(StrUtil.isNotBlank(question.getTitle()), Question::getTitle, question.getTitle())
                .eq(question.getType() != null, Question::getType, question.getType())
                .eq(question.getDifficulty() != null, Question::getDifficulty, question.getDifficulty())
                .eq(question.getRepoId() != null, Question::getRepoId, question.getRepoId());

        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public Integer getQuestionCount(Long repoId, Integer type) {
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                .eq(Question::getRepoId, repoId)
                .eq(Question::getType, type);
        return Math.toIntExact(baseMapper.selectCount(wrapper));
    }

    private List<QuestionVo> buildVo(List<Question> questionList) {
        List<QuestionVo> questionVoList = new ArrayList<>();
        for (Question question : questionList) {
            QuestionVo questionVo = new QuestionVo();
            BeanUtils.copyProperties(question, questionVo);
            questionVo.setRepoName(repoService.getById(question.getRepoId()).getName());
            questionVoList.add(questionVo);
        }
        return questionVoList;
    }

}

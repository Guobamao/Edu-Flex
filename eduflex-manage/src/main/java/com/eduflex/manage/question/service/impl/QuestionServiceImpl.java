package com.eduflex.manage.question.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.question.domain.Option;
import com.eduflex.manage.question.domain.Question;
import com.eduflex.manage.question.domain.vo.QuestionExportAndImportVo;
import com.eduflex.manage.question.domain.vo.QuestionVo;
import com.eduflex.manage.question.mapper.QuestionMapper;
import com.eduflex.manage.question.service.IQuestionService;
import com.eduflex.manage.repo.service.IRepoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
    public List<Question> selectExamQuestionList(Question question) {
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                .like(StrUtil.isNotBlank(question.getTitle()), Question::getTitle, question.getTitle())
                .eq(question.getType() != null, Question::getType, question.getType())
                .eq(question.getDifficulty() != null, Question::getDifficulty, question.getDifficulty())
                .eq(question.getRepoId() != null, Question::getRepoId, question.getRepoId());

        return baseMapper.selectList(wrapper);
    }

    @Override
    public Integer getQuestionCount(Long repoId, Integer type) {
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                .eq(Question::getRepoId, repoId)
                .eq(Question::getType, type);
        return Math.toIntExact(baseMapper.selectCount(wrapper));
    }

    @Override
    public List<QuestionVo> buildVo(List<Question> questionList) {
        List<QuestionVo> questionVoList = new ArrayList<>();
        for (Question question : questionList) {
            QuestionVo questionVo = new QuestionVo();
            BeanUtils.copyProperties(question, questionVo);
            questionVo.setRepoName(repoService.getById(question.getRepoId()).getName());

            questionVoList.add(questionVo);
        }
        return questionVoList;
    }

    @Override
    public List<QuestionExportAndImportVo> buildExportVo(List<Question> questions) {
        List<QuestionVo> questionVos = this.buildVo(questions);

        List<QuestionExportAndImportVo> exportVoList = new ArrayList<>();
        for (QuestionVo questionVo : questionVos) {
            QuestionExportAndImportVo questionExportAndImportVo = new QuestionExportAndImportVo();
            BeanUtils.copyProperties(questionVo, questionExportAndImportVo);
            if (questionVo.getType().equals(EduFlexConstants.SINGLE_CHOICE) || questionVo.getType().equals(EduFlexConstants.MULTIPLE_CHOICE)) {
                List<Map> optionMaps = JSON.parseArray(questionVo.getOptions(), Map.class);
                Option option = new Option();
                for (Map optionMap : optionMaps) {
                    if (optionMap.get("key").equals("A")) {
                        option.setOptionA((String) optionMap.get("value"));
                    } else if (optionMap.get("key").equals("B")) {
                        option.setOptionB((String) optionMap.get("value"));
                    } else if (optionMap.get("key").equals("C")) {
                        option.setOptionC((String) optionMap.get("value"));
                    } else if (optionMap.get("key").equals("D")) {
                        option.setOptionD((String) optionMap.get("value"));
                    }
                }
                questionExportAndImportVo.setOptions(option);
            }
            List<String> answerString = JSON.parseArray(questionVo.getAnswer(), String.class);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < answerString.size(); i++) {
                if (i == answerString.size() - 1) {
                    sb.append(answerString.get(i));
                } else {
                    sb.append(answerString.get(i)).append(",");
                }
            }
            questionExportAndImportVo.setAnswer(sb.toString());
            exportVoList.add(questionExportAndImportVo);
        }
        return exportVoList;
    }

    @Override
    public String importData(List<QuestionExportAndImportVo> questionList, Long repoId, String operName) {
        if (questionList.isEmpty()) {
            throw new ServiceException("导入题目数据不能为空！");
        }

        int successNum = 0;
        int failedNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        for (QuestionExportAndImportVo questionVo : questionList) {
            Question question = new Question();
            BeanUtil.copyProperties(questionVo, question);
            question.setRepoId(repoId);
            if (questionVo.getType().equals(EduFlexConstants.SINGLE_CHOICE) || questionVo.getType().equals(EduFlexConstants.MULTIPLE_CHOICE)) {
                Option option = questionVo.getOptions();
                List<Map<String, String>> optionsMap = new ArrayList<>();
                if (option != null) {
                    if (StrUtil.isNotBlank(option.getOptionA())) {
                        optionsMap.add(Map.of("key", "A", "value", option.getOptionA()));
                    }
                    if (StrUtil.isNotBlank(option.getOptionB())) {
                        optionsMap.add(Map.of("key", "B", "value", option.getOptionB()));
                    }
                    if (StrUtil.isNotBlank(option.getOptionC())) {
                        optionsMap.add(Map.of("key", "C", "value", option.getOptionC()));
                    }
                    if (StrUtil.isNotBlank(option.getOptionD())) {
                        optionsMap.add(Map.of("key", "D", "value", option.getOptionD()));
                    }
                }
                if (!optionsMap.isEmpty()) {
                    question.setOptions(JSON.toJSONString(optionsMap));
                }

            } else {
                question.setOptions("[]");
            }
            if (StrUtil.isNotBlank(questionVo.getAnswer())) {
                question.setAnswer(JSON.toJSONString(Arrays.asList(questionVo.getAnswer().split(","))));
            }
            question.setCreateBy(operName);

            try {
                baseMapper.insert(question);
                successNum++;
                successMsg.append("<br/>" + successNum + "、题目 " + questionVo.getTitle() + " 导入成功");
            } catch (Exception e) {
                failedNum++;
                String msg = "<br/>" + failedNum + "、题目 " + questionVo.getTitle() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failedNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failedNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}

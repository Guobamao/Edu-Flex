package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.*;
import java.util.stream.Collectors;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.manage.domain.ExamPaperQuestion;
import com.eduflex.manage.domain.ExamPaperRepo;
import com.eduflex.manage.domain.Question;
import com.eduflex.manage.domain.dto.PaperDto;
import com.eduflex.manage.domain.dto.PaperQuestionDto;
import com.eduflex.manage.domain.dto.RepoInfo;
import com.eduflex.manage.domain.vo.ExamPaperVo;
import com.eduflex.manage.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.ExamPaperMapper;
import com.eduflex.manage.domain.ExamPaper;

/**
 * 试卷管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class ExamPaperServiceImpl extends ServiceImpl<ExamPaperMapper, ExamPaper> implements IExamPaperService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IExamPaperRepoService examPaperRepoService;

    @Autowired
    private IQuestionService questionService;

    @Autowired
    private IExamPaperService examPaperService;

    @Autowired
    private IExamPaperQuestionService examPaperQuestionService;

    @Override
    public List<ExamPaperVo> selectExamPaperList(ExamPaper examPaper) {
        LambdaQueryWrapper<ExamPaper> wrapper = new LambdaQueryWrapper<ExamPaper>()
                .like(StrUtil.isNotBlank(examPaper.getTitle()), ExamPaper::getTitle, examPaper.getTitle())
                .eq(examPaper.getCourseId() != null, ExamPaper::getCourseId, examPaper.getCourseId());
        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public Map<Integer, List<Question>> generateQuestions(PaperDto paperDto) {
        // 关联题库信息
        List<RepoInfo> repoInfos = paperDto.getRepoInfos();
        List<ExamPaperRepo> examPaperRepoList = new ArrayList<>();

        LambdaQueryWrapper<ExamPaperRepo> wrapper = new LambdaQueryWrapper<ExamPaperRepo>()
                .eq(paperDto.getId() != null, ExamPaperRepo::getPaperId, paperDto.getId());
        examPaperRepoService.remove(wrapper);

        // 计算总分，更新试卷总分
        int totalScore = 0;

        for (RepoInfo repoInfo : repoInfos) {

            ExamPaperRepo examPaperRepo = new ExamPaperRepo();
            BeanUtils.copyProperties(repoInfo, examPaperRepo);
            examPaperRepo.setPaperId(paperDto.getId());
            examPaperRepoList.add(examPaperRepo);

            totalScore += repoInfo.getSingleChoiceCount() * repoInfo.getSingleChoiceScore() +
                    repoInfo.getMultipleChoiceCount() * repoInfo.getMultipleChoiceScore() +
                    repoInfo.getJudgeCount() * repoInfo.getJudgeScore() +
                    repoInfo.getBlankCount() * repoInfo.getBlankScore() +
                    repoInfo.getShortAnswerCount() * repoInfo.getShortAnswerScore();
        }

        ExamPaper examPaper = new ExamPaper();
        examPaper.setId(paperDto.getId());
        examPaper.setTotalScore(totalScore);
        examPaperService.updateById(examPaper);
        examPaperRepoService.saveOrUpdateBatch(examPaperRepoList);

        return generateQuestions(repoInfos);
    }

    @Override
    public boolean composePaper(PaperQuestionDto paperQuestionDto) {

        LambdaQueryWrapper<ExamPaperQuestion> wrapper = new LambdaQueryWrapper<ExamPaperQuestion>()
                .eq(ExamPaperQuestion::getPaperId, paperQuestionDto.getId());
        examPaperQuestionService.remove(wrapper);

        List<ExamPaperQuestion> examPaperQuestionList = new ArrayList<>();
        for (Map.Entry<Integer, List<Long>> questionEntry : paperQuestionDto.getQuestionMap().entrySet()) {
            Integer type = questionEntry.getKey();
            List<Long> questionList = questionEntry.getValue();
            int orderNum = 1;
            for (Long questionId : questionList) {
                ExamPaperQuestion examPaperQuestion = new ExamPaperQuestion();
                examPaperQuestion.setPaperId(paperQuestionDto.getId());
                examPaperQuestion.setQuestionId(questionId);
                examPaperQuestion.setType(type);
                examPaperQuestion.setOrderNum(orderNum++);
                examPaperQuestionList.add(examPaperQuestion);
            }
        }
        return examPaperQuestionService.saveBatch(examPaperQuestionList);
    }

    // 生成题目
    private Map<Integer, List<Question>> generateQuestions(List<RepoInfo> repoInfos) {
        // 返回的题目 <题目类型, 题目>
        Map<Integer, List<Question>> selectedQuestions = new HashMap<>();

        // 生成题目
        for (RepoInfo repoInfo : repoInfos) {
            // 查询题库下所有题目
            LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                    .eq(Question::getRepoId, repoInfo.getRepoId());
            List<Question> questionList = questionService.list(wrapper);

            // 按题目类型和难度分类
            Map<Integer, Map<Integer, List<Question>>> categorizedQuestions = questionList.stream()
                    .collect(Collectors.groupingBy(Question::getType, Collectors.groupingBy(Question::getDifficulty)));

            // 题目类型与数量
            Map<Integer, Integer> typeEntries = new HashMap<>();
            typeEntries.put(EduFlexConstants.SINGLE_CHOICE, repoInfo.getSingleChoiceCount());
            typeEntries.put(EduFlexConstants.MULTIPLE_CHOICE, repoInfo.getMultipleChoiceCount());
            typeEntries.put(EduFlexConstants.JUDGMENT, repoInfo.getJudgeCount());
            typeEntries.put(EduFlexConstants.FILL_BLANK, repoInfo.getBlankCount());
            typeEntries.put(EduFlexConstants.SHORT_ANSWER, repoInfo.getShortAnswerCount());

            for (Map.Entry<Integer, Integer> typeEntry : typeEntries.entrySet()) {
                Integer type = typeEntry.getKey();
                Integer totalRequired = typeEntry.getValue();

                // 难度分布
                Map<Integer, Integer> diffEntries = new HashMap<>();
                diffEntries.put(EduFlexConstants.DIFFICULTY_EASY, totalRequired * 60 / 100); // 简单 - 60%
                diffEntries.put(EduFlexConstants.DIFFICULTY_MEDIUM, totalRequired * 30 / 100); // 中等 - 30%
                diffEntries.put(EduFlexConstants.DIFFICULTY_HARD, totalRequired * 10 / 100); // 困难 - 10%

                List<Question> selectedList = new ArrayList<>();

                // 按照难度分配题目
                for (Map.Entry<Integer, Integer> diffEntry : diffEntries.entrySet()) {
                    Integer difficulty = diffEntry.getKey();
                    Integer required = diffEntry.getValue();

                    List<Question> availableQuestions = categorizedQuestions.getOrDefault(type, Collections.emptyMap())
                            .getOrDefault(difficulty, Collections.emptyList());

                    // 随机抽取所选题目
                    Collections.shuffle(availableQuestions);
                    selectedList.addAll(availableQuestions.stream().limit(required).toList());
                }

                // 如果题目数量不足，则补充随机题目
                if (selectedList.size() < totalRequired) {
                    // 剩余题目
                    List<Question> remainingQuestions = new ArrayList<>(questionList.stream()
                            .filter(question -> question.getType().equals(type) && !selectedList.contains(question))
                            .toList());

                    Collections.shuffle(remainingQuestions);
                    selectedList.addAll(remainingQuestions.stream().limit(totalRequired - selectedList.size()).toList());
                }

                selectedQuestions.put(type, selectedList);
            }
        }
        return selectedQuestions;
    }

    private List<ExamPaperVo> buildVo(List<ExamPaper> examPaperList) {
        List<ExamPaperVo> examPaperVoList = new ArrayList<>();
        for (ExamPaper examPaper : examPaperList) {
            ExamPaperVo examPaperVo = new ExamPaperVo();
            BeanUtils.copyProperties(examPaper, examPaperVo);
            examPaperVo.setCourseName(courseService.getById(examPaper.getCourseId()).getName());
            examPaperVoList.add(examPaperVo);
        }
        return examPaperVoList;
    }
}

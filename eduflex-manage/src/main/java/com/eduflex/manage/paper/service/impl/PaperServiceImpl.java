package com.eduflex.manage.paper.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.*;
import java.util.stream.Collectors;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.paper.domain.PaperQuestion;
import com.eduflex.manage.paper.domain.PaperRepo;
import com.eduflex.manage.paper.service.IPaperQuestionService;
import com.eduflex.manage.paper.service.IPaperRepoService;
import com.eduflex.manage.paper.service.IPaperService;
import com.eduflex.manage.question.domain.Question;
import com.eduflex.manage.paper.domain.dto.PaperDto;
import com.eduflex.manage.paper.domain.dto.PaperQuestionDto;
import com.eduflex.manage.question.service.IQuestionService;
import com.eduflex.manage.repo.domain.dto.RepoInfo;
import com.eduflex.manage.paper.domain.vo.PaperQuestionVo;
import com.eduflex.manage.paper.domain.vo.PaperVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.paper.mapper.PaperMapper;
import com.eduflex.manage.paper.domain.Paper;

/**
 * 试卷管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper> implements IPaperService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IPaperRepoService examPaperRepoService;

    @Autowired
    private IQuestionService questionService;

    @Autowired
    private IPaperService examPaperService;

    @Autowired
    private IPaperQuestionService examPaperQuestionService;

    @Override
    public List<PaperVo> selectExamPaperList(Paper paper) {
        LambdaQueryWrapper<Paper> wrapper = new LambdaQueryWrapper<Paper>()
                .like(StrUtil.isNotBlank(paper.getTitle()), Paper::getTitle, paper.getTitle())
                .eq(paper.getCourseId() != null, Paper::getCourseId, paper.getCourseId());
        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public boolean composePaper(PaperQuestionDto paperQuestionDto) {
        LambdaQueryWrapper<PaperQuestion> wrapper = new LambdaQueryWrapper<PaperQuestion>()
                .eq(PaperQuestion::getPaperId, paperQuestionDto.getId());
        examPaperQuestionService.remove(wrapper);

        List<PaperQuestion> paperQuestionList = new ArrayList<>();
        int orderNum = 1;
        for (Map.Entry<Integer, List<Long>> questionEntry : paperQuestionDto.getQuestionMap().entrySet()) {
            Integer type = questionEntry.getKey();
            List<Long> questionList = questionEntry.getValue();

            for (Long questionId : questionList) {
                PaperQuestion paperQuestion = new PaperQuestion();
                paperQuestion.setPaperId(paperQuestionDto.getId());
                paperQuestion.setQuestionId(questionId);
                paperQuestion.setType(type);
                paperQuestion.setOrderNum(orderNum++);
                paperQuestionList.add(paperQuestion);
            }
        }
        return examPaperQuestionService.saveBatch(paperQuestionList);
    }

    @Override
    public Map<Integer, List<PaperQuestionVo>> generateQuestions(PaperDto paperDto) {
        // 关联题库信息
        List<RepoInfo> repoInfos = paperDto.getRepoInfos();
        List<PaperRepo> paperRepoList = new ArrayList<>();

        LambdaQueryWrapper<PaperRepo> wrapper = new LambdaQueryWrapper<PaperRepo>()
                .eq(paperDto.getId() != null, PaperRepo::getPaperId, paperDto.getId());
        examPaperRepoService.remove(wrapper);

        // 计算总分，更新试卷总分
        int totalScore = 0;

        for (RepoInfo repoInfo : repoInfos) {

            PaperRepo paperRepo = new PaperRepo();
            BeanUtils.copyProperties(repoInfo, paperRepo);
            paperRepo.setPaperId(paperDto.getId());
            paperRepoList.add(paperRepo);

            totalScore += repoInfo.getSingleChoiceCount() * repoInfo.getSingleChoiceScore() +
                    repoInfo.getMultipleChoiceCount() * repoInfo.getMultipleChoiceScore() +
                    repoInfo.getJudgeCount() * repoInfo.getJudgeScore() +
                    repoInfo.getBlankCount() * repoInfo.getBlankScore() +
                    repoInfo.getShortAnswerCount() * repoInfo.getShortAnswerScore();
        }

        Paper paper = new Paper();
        paper.setId(paperDto.getId());
        paper.setTotalScore(totalScore);
        examPaperService.updateById(paper);
        examPaperRepoService.saveOrUpdateBatch(paperRepoList);

        return generateQuestions(repoInfos);
    }

    // 生成题目
    private Map<Integer, List<PaperQuestionVo>> generateQuestions(List<RepoInfo> repoInfos) {
        int orderNum = 1;
        // 返回的题目 <题目类型, 题目>
        Map<Integer, List<PaperQuestionVo>> selectedQuestions = new HashMap<>();

        // 生成题目
        for (RepoInfo repoInfo : repoInfos) {
            // 查询题库下所有题目
            LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<Question>()
                    .eq(Question::getRepoId, repoInfo.getRepoId());
            List<Question> questions = questionService.list(wrapper);

            List<PaperQuestionVo> questionList = new ArrayList<>();
            for (Question question : questions) {
                PaperQuestionVo paperQuestionVo = new PaperQuestionVo();
                BeanUtils.copyProperties(question, paperQuestionVo);
                questionList.add(paperQuestionVo);
            }

            // 按题目类型和难度分类
            Map<Integer, Map<Integer, List<PaperQuestionVo>>> categorizedQuestions = questionList.stream()
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

                // 计算简单、中等、困难题目数量
                int easy = totalRequired * 60 / 100;
                int medium = totalRequired * 30 / 100;
                int hard = totalRequired * 10 / 100;

                // 计算剩余未分配数量
                int remaining = totalRequired - easy - medium - hard;

                // 动态分配余数
                if  (remaining > 0) {
                    int easyRemaining = (int) Math.round(remaining * 60.0 / 100);
                    int mediumRemaining = (int) Math.round(remaining * 30.0 / 100);
                    int hardRemaining = remaining - easyRemaining - mediumRemaining;

                    easy += easyRemaining;
                    medium += mediumRemaining;
                    hard += hardRemaining;
                }

                diffEntries.put(EduFlexConstants.DIFFICULTY_EASY, easy);
                diffEntries.put(EduFlexConstants.DIFFICULTY_MEDIUM, medium);
                diffEntries.put(EduFlexConstants.DIFFICULTY_HARD, hard);

                List<PaperQuestionVo> selectedList = new ArrayList<>();

                // 按照难度分配题目
                for (Map.Entry<Integer, Integer> diffEntry : diffEntries.entrySet()) {
                    Integer difficulty = diffEntry.getKey();
                    Integer required = diffEntry.getValue();

                    List<PaperQuestionVo> availableQuestions = categorizedQuestions.getOrDefault(type, Collections.emptyMap())
                            .getOrDefault(difficulty, Collections.emptyList());

                    // 随机抽取所选题目
                    Collections.shuffle(availableQuestions);
                    selectedList.addAll(availableQuestions.stream().limit(required).toList());
                }

                // 如果题目数量不足，则补充随机题目
                if (selectedList.size() < totalRequired) {
                    // 剩余题目
                    List<PaperQuestionVo> remainingQuestions = new ArrayList<>(questionList.stream()
                            .filter(question -> question.getType().equals(type) && !selectedList.contains(question))
                            .toList());

                    Collections.shuffle(remainingQuestions);
                    selectedList.addAll(remainingQuestions.stream().limit(totalRequired - selectedList.size()).toList());
                }

                for (PaperQuestionVo paperQuestionVo : selectedList) {
                    paperQuestionVo.setOrderNum(orderNum++);
                }
                selectedQuestions.put(type, selectedList);
            }
        }
        return selectedQuestions;
    }

    private List<PaperVo> buildVo(List<Paper> paperList) {
        List<PaperVo> examPaperVoList = new ArrayList<>();
        for (Paper paper : paperList) {
            PaperVo examPaperVo = new PaperVo();
            BeanUtils.copyProperties(paper, examPaperVo);
            examPaperVo.setCourseName(courseService.getById(paper.getCourseId()).getName());
            examPaperVoList.add(examPaperVo);
        }
        return examPaperVoList;
    }
}

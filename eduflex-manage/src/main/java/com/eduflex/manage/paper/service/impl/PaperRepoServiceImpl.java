package com.eduflex.manage.paper.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.paper.domain.PaperRepo;
import com.eduflex.manage.paper.domain.vo.PaperRepoVo;
import com.eduflex.manage.paper.mapper.PaperRepoMapper;
import com.eduflex.manage.paper.service.IPaperRepoService;
import com.eduflex.manage.question.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * 试卷题库关联 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-10
 */
@Service
public class PaperRepoServiceImpl extends ServiceImpl<PaperRepoMapper, PaperRepo> implements IPaperRepoService {

    @Autowired
    private IQuestionService questionService;

    @Override
    public List<PaperRepoVo> selectRepoListByPaperId(Long id) {
        LambdaQueryWrapper<PaperRepo> wrapper = new LambdaQueryWrapper<PaperRepo>()
                .eq(PaperRepo::getPaperId, id);

        List<PaperRepo> paperRepos = baseMapper.selectList(wrapper);
        List<PaperRepoVo> paperRepoVos = new ArrayList<>();
        for (PaperRepo paperRepo : paperRepos) {
            PaperRepoVo paperRepoVo = new PaperRepoVo();
            BeanUtils.copyProperties(paperRepo, paperRepoVo);
            paperRepoVo.setSingleChoiceTotal(questionService.getQuestionCount(paperRepo.getRepoId(), EduFlexConstants.SINGLE_CHOICE));
            paperRepoVo.setMultipleChoiceTotal(questionService.getQuestionCount(paperRepo.getRepoId(), EduFlexConstants.MULTIPLE_CHOICE));
            paperRepoVo.setJudgeTotal(questionService.getQuestionCount(paperRepo.getRepoId(), EduFlexConstants.JUDGMENT));
            paperRepoVo.setBlankTotal(questionService.getQuestionCount(paperRepo.getRepoId(), EduFlexConstants.FILL_BLANK));
            paperRepoVo.setShortAnswerTotal(questionService.getQuestionCount(paperRepo.getRepoId(), EduFlexConstants.SHORT_ANSWER));
            paperRepoVos.add(paperRepoVo);
        }
        return paperRepoVos;
    }
}

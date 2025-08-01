package com.eduflex.manage.repo.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.question.service.IQuestionService;
import com.eduflex.manage.repo.domain.Repo;
import com.eduflex.manage.repo.domain.dto.RepoDto;
import com.eduflex.manage.repo.domain.vo.RepoVo;
import com.eduflex.manage.repo.mapper.RepoMapper;
import com.eduflex.manage.repo.service.IRepoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 题库管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-09
 */
@Service
public class RepoServiceImpl extends ServiceImpl<RepoMapper, Repo> implements IRepoService {

    @Autowired
    private ICourseService courseService;

    @Override
    public List<Repo> selectRepoList(RepoDto repo) {
        LambdaQueryWrapper<Repo> wrapper = new LambdaQueryWrapper<Repo>()
                .like(StrUtil.isNotBlank(repo.getName()), Repo::getName, repo.getName())
                .eq(repo.getCourseId() != null, Repo::getCourseId, repo.getCourseId());

        if (repo.getExcludes() != null) {
            List<Long> idList = CollUtil.toList(repo.getExcludes());
            wrapper.notIn(Repo::getId, idList);
        }
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<RepoVo> buildVo(List<Repo> repoList) {
        IQuestionService questionService = SpringUtils.getBean(IQuestionService.class);
        List<RepoVo> repoVoList = new ArrayList<>();
        for (Repo repo : repoList) {
            RepoVo repoVo = new RepoVo();
            BeanUtils.copyProperties(repo, repoVo);
            repoVo.setCourseName(courseService.getById(repo.getCourseId()).getName());
            repoVo.setSingleChoiceCount(questionService.getQuestionCount(repo.getId(), EduFlexConstants.SINGLE_CHOICE));
            repoVo.setMultipleChoiceCount(questionService.getQuestionCount(repo.getId(), EduFlexConstants.MULTIPLE_CHOICE));
            repoVo.setJudgeCount(questionService.getQuestionCount(repo.getId(), EduFlexConstants.JUDGMENT));
            repoVo.setBlankCount(questionService.getQuestionCount(repo.getId(), EduFlexConstants.FILL_BLANK));
            repoVo.setShortAnswerCount(questionService.getQuestionCount(repo.getId(), EduFlexConstants.SHORT_ANSWER));
            repoVoList.add(repoVo);
        }
        return repoVoList;
    }
}

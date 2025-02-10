package com.eduflex.manage.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.manage.domain.dto.RepoDto;
import com.eduflex.manage.domain.vo.RepoVo;
import com.eduflex.manage.service.ICourseService;
import com.eduflex.manage.service.IQuestionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.RepoMapper;
import com.eduflex.manage.domain.Repo;
import com.eduflex.manage.service.IRepoService;

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

    @Autowired
    private IQuestionService questionService;

    @Override
    public List<RepoVo> selectRepoList(RepoDto repo) {
        LambdaQueryWrapper<Repo> wrapper = new LambdaQueryWrapper<Repo>()
                .like(StrUtil.isNotBlank(repo.getName()), Repo::getName, repo.getName())
                .eq(repo.getCourseId() != null, Repo::getCourseId, repo.getCourseId());

        if (repo.getExcludes() != null) {
            List<Long> idList = CollUtil.toList(repo.getExcludes());
            wrapper.notIn(Repo::getId, idList);
        }
        return buildVo(baseMapper.selectList(wrapper));
    }

    private List<RepoVo> buildVo(List<Repo> repoList) {
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

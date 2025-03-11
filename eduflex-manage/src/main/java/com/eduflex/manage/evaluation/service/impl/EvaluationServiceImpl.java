package com.eduflex.manage.evaluation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.mapper.EvaluationMapper;
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.evaluation.domain.vo.EvaluationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 课程评价管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-25
 */
@Service
public class EvaluationServiceImpl extends ServiceImpl<EvaluationMapper, Evaluation> implements IEvaluationService {

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ICourseService courseService;

    @Override
    public List<Evaluation> selectEvaluationList(Evaluation evaluation) {
        LambdaQueryWrapper<Evaluation> wrapper = new LambdaQueryWrapper<Evaluation>()
                .eq(evaluation.getCourseId() != null, Evaluation::getCourseId, evaluation.getCourseId())
                .eq(evaluation.getUserId() != null, Evaluation::getUserId, evaluation.getUserId())
                .eq(evaluation.getScore() != null, Evaluation::getScore, evaluation.getScore());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<EvaluationVo> buildVo(List<Evaluation> evaluationList) {
        List<EvaluationVo> evaluationVoList = new ArrayList<>();
        for (Evaluation evaluation : evaluationList) {
            EvaluationVo evaluationVo = new EvaluationVo();
            SysUser sysUser = sysUserService.selectUserById(evaluation.getUserId());
            evaluationVo.setNickName(sysUser.getNickName());
            evaluationVo.setAvatar(sysUser.getAvatar());
            evaluationVo.setScore(evaluation.getScore());
            evaluationVo.setContent(evaluation.getContent());
            evaluationVo.setCreateTime(evaluation.getCreateTime());

            Course course = courseService.getById(evaluation.getCourseId());
            evaluationVo.setCourseId(course.getId());
            evaluationVo.setCourseName(course.getName());
            evaluationVoList.add(evaluationVo);
        }
        return evaluationVoList;
    }

    @Override
    public int saveEvaluation(Evaluation evaluation) {
        LambdaQueryWrapper<Evaluation> wrapper = new LambdaQueryWrapper<Evaluation>()
                .eq(Evaluation::getUserId, evaluation.getUserId())
                .eq(Evaluation::getCourseId, evaluation.getCourseId());
        if (baseMapper.selectOne(wrapper) != null) {
            throw new ServiceException("您已经评价过该课程，请勿重复评价！");
        } else {
            return baseMapper.insert(evaluation);
        }
    }
}

package com.eduflex.manage.evaluation.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.domain.vo.EvaluationStatistics;
import com.eduflex.manage.evaluation.domain.vo.EvaluationVo;
import com.eduflex.manage.evaluation.mapper.EvaluationMapper;
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.evaluation.domain.vo.UserEvaluationVo;
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
    public List<EvaluationVo> buildVo(List<Evaluation> list) {
        List<EvaluationVo> evaluationVoList = new ArrayList<>();
        for (Evaluation evaluation : list) {
            EvaluationVo evaluationVo = new EvaluationVo();
            BeanUtil.copyProperties(evaluation, evaluationVo);
            SysUser sysUser = sysUserService.selectUserById(evaluation.getUserId());
            evaluationVo.setUserName(sysUser.getUserName());
            evaluationVo.setNickName(sysUser.getNickName());
            Course course = courseService.getById(evaluation.getCourseId());
            evaluationVo.setCourseName(course.getName());
            evaluationVoList.add(evaluationVo);
        }
        return evaluationVoList;
    }

    @Override
    public List<UserEvaluationVo> buildUserVo(List<Evaluation> evaluationList) {
        List<UserEvaluationVo> userEvaluationVoList = new ArrayList<>();
        for (Evaluation evaluation : evaluationList) {
            UserEvaluationVo userEvaluationVo = new UserEvaluationVo();
            SysUser sysUser = sysUserService.selectUserById(evaluation.getUserId());
            userEvaluationVo.setNickName(sysUser.getNickName());
            userEvaluationVo.setAvatar(sysUser.getAvatar());
            userEvaluationVo.setScore(evaluation.getScore());
            userEvaluationVo.setContent(evaluation.getContent());
            userEvaluationVo.setCreateTime(evaluation.getCreateTime());

            Course course = courseService.getById(evaluation.getCourseId());
            userEvaluationVo.setCourseId(course.getId());
            userEvaluationVo.setCourseName(course.getName());
            userEvaluationVoList.add(userEvaluationVo);
        }
        return userEvaluationVoList;
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

    @Override
    public EvaluationStatistics statistics(Long courseId) {
        LambdaQueryWrapper<Evaluation> wrapper = new LambdaQueryWrapper<Evaluation>()
                .eq(Evaluation::getCourseId, courseId);
        List<Evaluation> evaluationList = baseMapper.selectList(wrapper);

        EvaluationStatistics evaluationStatistics = new EvaluationStatistics();
        int oneStarNum = 0;
        int twoStarNum = 0;
        int threeStarNum = 0;
        int fourStarNum = 0;
        int fiveStarNum = 0;

        evaluationStatistics.setTotalNum(evaluationList.size());
        evaluationList.forEach(evaluation -> {
            switch (evaluation.getScore()) {
                case 1:
                    evaluationStatistics.setOneStarNum(oneStarNum + 1);
                    break;
                case 2:
                    evaluationStatistics.setTwoStarNum(twoStarNum + 1);
                    break;
                case 3:
                    evaluationStatistics.setThreeStarNum(threeStarNum + 1);
                    break;
                case 4:
                    evaluationStatistics.setFourStarNum(fourStarNum + 1);
                    break;
                case 5:
                    evaluationStatistics.setFiveStarNum(fiveStarNum + 1);
                    break;
                default:
                    break;
            }
        });
        return evaluationStatistics;
    }
}

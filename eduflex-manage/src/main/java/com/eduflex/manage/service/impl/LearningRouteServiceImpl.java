package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.manage.domain.vo.LearningRouteVo;
import com.eduflex.manage.service.IGoalService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.LearningRouteMapper;
import com.eduflex.manage.domain.LearningRoute;
import com.eduflex.manage.service.ILearningRouteService;

/**
 * 学习路线管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */
@Service
public class LearningRouteServiceImpl extends ServiceImpl<LearningRouteMapper, LearningRoute> implements ILearningRouteService {

    @Autowired
    private IGoalService goalService;

    @Override
    public List<LearningRouteVo> selectLearningRouteList(LearningRoute learningRoute) {
        LambdaQueryWrapper<LearningRoute> wrapper = new LambdaQueryWrapper<LearningRoute>()
                .eq(learningRoute.getGoalId() != null, LearningRoute::getGoalId, learningRoute.getGoalId());
        return buildVo(baseMapper.selectList(wrapper));
    }

    private List<LearningRouteVo> buildVo(List<LearningRoute> learningRouteList) {
        List<LearningRouteVo> learningRouteVos = new ArrayList<>();
        for (LearningRoute learningRoute : learningRouteList) {
            LearningRouteVo learningRouteVo = new LearningRouteVo();
            BeanUtils.copyProperties(learningRoute, learningRouteVo);
            learningRouteVo.setGoalName(goalService.getById(learningRoute.getGoalId()).getGoalName());
            learningRouteVos.add(learningRouteVo);
        }
        return learningRouteVos;
    }
}

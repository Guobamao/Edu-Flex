package com.eduflex.manage.route.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.manage.route.domain.vo.RouteVo;
import com.eduflex.manage.goal.service.IGoalService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.route.mapper.RouteMapper;
import com.eduflex.manage.route.domain.Route;
import com.eduflex.manage.route.service.IRouteService;

/**
 * 学习路线管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */
@Service
public class RouteServiceImpl extends ServiceImpl<RouteMapper, Route> implements IRouteService {

    @Autowired
    private IGoalService goalService;

    @Override
    public List<RouteVo> selectLearningRouteList(Route route) {
        LambdaQueryWrapper<Route> wrapper = new LambdaQueryWrapper<Route>()
                .eq(route.getGoalId() != null, Route::getGoalId, route.getGoalId());
        return buildVo(baseMapper.selectList(wrapper));
    }

    private List<RouteVo> buildVo(List<Route> routeList) {
        List<RouteVo> routeVos = new ArrayList<>();
        for (Route route : routeList) {
            RouteVo routeVo = new RouteVo();
            BeanUtils.copyProperties(route, routeVo);
            routeVo.setGoalName(goalService.getById(route.getGoalId()).getGoalName());
            routeVos.add(routeVo);
        }
        return routeVos;
    }
}

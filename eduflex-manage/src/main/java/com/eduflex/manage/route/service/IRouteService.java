package com.eduflex.manage.route.service;

import java.util.List;
import com.eduflex.manage.route.domain.Route;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.route.domain.vo.RouteVo;

/**
 * 学习路线管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */
public interface IRouteService extends IService<Route> {
    /**
     * 查询学习路线管理列表
     *
     * @param route 学习路线管理
     * @return 学习路线管理集合
     */
    List<RouteVo> selectLearningRouteList(Route route);
}

package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.LearningRoute;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.LearningRouteVo;

/**
 * 学习路线管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */
public interface ILearningRouteService extends IService<LearningRoute> {
    /**
     * 查询学习路线管理列表
     *
     * @param learningRoute 学习路线管理
     * @return 学习路线管理集合
     */
    List<LearningRouteVo> selectLearningRouteList(LearningRoute learningRoute);
}

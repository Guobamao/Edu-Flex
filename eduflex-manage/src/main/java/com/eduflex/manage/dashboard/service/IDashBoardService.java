package com.eduflex.manage.dashboard.service;

import com.eduflex.manage.dashboard.domain.vo.StatVo;
import com.eduflex.manage.dashboard.domain.vo.TopCourseVo;
import com.eduflex.manage.dashboard.domain.vo.TrendVo;

import java.util.List;

/**
 * 数据面板 Service
 * @author 林煜鋒
 */
public interface IDashBoardService {

    /**
     * 获取统计数据
     * @return 统计数据
     */
    StatVo getStats();

    /**
     * 获取热门课程数据
     * @return 热门课程数据
     */
    List<TopCourseVo> getTopCourses();

    /**
     * 获取最近选课趋势
     * @return 最近选课趋势
     */
    List<TrendVo> getTrend();
}

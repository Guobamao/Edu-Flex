package com.eduflex.manage.direction.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.direction.domain.Direction;

import java.util.List;

/**
 * 课程方向 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-12
 */
public interface IDirectionService extends IService<Direction> {
    /**
     * 查询课程方向列表
     *
     * @param direction 课程方向
     * @return 课程方向集合
     */
    List<Direction> selectDirectionList(Direction direction);

    /**
     * 删除课程方向信息
     *
     * @param idList 课程方向ID集合
     * @return 结果
     */
    int removeDirection(List<Long> idList);
}

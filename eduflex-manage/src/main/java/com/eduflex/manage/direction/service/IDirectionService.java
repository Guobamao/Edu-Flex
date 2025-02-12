package com.eduflex.manage.direction.service;

import java.util.List;
import com.eduflex.manage.direction.domain.Direction;
import com.baomidou.mybatisplus.extension.service.IService;

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
}

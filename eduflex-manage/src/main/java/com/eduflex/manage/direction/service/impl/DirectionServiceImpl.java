package com.eduflex.manage.direction.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;
        import com.eduflex.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.direction.mapper.DirectionMapper;
import com.eduflex.manage.direction.domain.Direction;
import com.eduflex.manage.direction.service.IDirectionService;

/**
 * 课程方向Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-12
 */
@Service
public class DirectionServiceImpl extends ServiceImpl<DirectionMapper, Direction> implements IDirectionService {

    @Override
    public List<Direction> selectDirectionList(Direction direction) {
        LambdaQueryWrapper<Direction> wrapper = new LambdaQueryWrapper<Direction>()
                .like(StrUtil.isNotBlank(direction.getName()), Direction::getName, direction.getName())
                .eq(direction.getStatus() != null, Direction::getStatus, direction.getStatus());
        return baseMapper.selectList(wrapper);
    }
}

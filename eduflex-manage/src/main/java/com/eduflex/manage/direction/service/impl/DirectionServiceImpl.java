package com.eduflex.manage.direction.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.service.ICategoryService;
import com.eduflex.manage.direction.domain.Direction;
import com.eduflex.manage.direction.mapper.DirectionMapper;
import com.eduflex.manage.direction.service.IDirectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Transactional
    @Override
    public int removeDirection(List<Long> idList) {
        ICategoryService categoryService = SpringUtils.getBean(ICategoryService.class);
        if (CollUtil.isNotEmpty(idList)) {
            for (Long directionId : idList) {
                LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>()
                        .eq(Category::getDirectionId, directionId);
                List<Category> categoryList = categoryService.list(wrapper);
                if (CollUtil.isNotEmpty(categoryList)) {
                    for (Category category : categoryList) {
                        categoryService.removeCategory(category.getId());
                    }
                }
                baseMapper.deleteById(directionId);
            }
            return 1;
        }
        return 0;
    }
}

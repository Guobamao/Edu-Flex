package com.eduflex.manage.category.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.mapper.CategoryMapper;
import org.springframework.stereotype.Service;
import com.eduflex.manage.category.service.ICategoryService;

/**
 * 课程分类Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

    /**
     * 查询课程分类列表
     *
     * @param category 课程分类
     * @return 课程分类
     */
    @Override
    public List<Category> selectCourseCategoryList(Category category) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>()
                .like(category.getName() != null && !category.getName().isEmpty(), Category::getName, category.getName())
                .eq(category.getParentId() != null, Category::getParentId, category.getParentId());
        return baseMapper.selectList(wrapper);
    }

    /**
     * 判断是否有子节点
     * @param categoryId 分类ID
     * @return 布尔值
     */
    @Override
    public boolean hasChildByCategoryId(Long categoryId) {
        int result = baseMapper.hasChildByCategoryId(categoryId);
        return result > 0;
    }

    /**
     * 新增分类
     * @param category 分类
     * @return 影响条数
     */
    @Override
    public int insertCategory(Category category) {
        Category info = baseMapper.selectById(category.getParentId());
        if (info != null) {
            category.setAncestors(info.getAncestors() + "," + category.getParentId());
        } else {
            category.setAncestors("0");
        }
        return baseMapper.insert(category);
    }
}

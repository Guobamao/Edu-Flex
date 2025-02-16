package com.eduflex.manage.category.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.domain.vo.CategoryVo;
import com.eduflex.manage.category.mapper.CategoryMapper;
import com.eduflex.manage.direction.service.IDirectionService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private IDirectionService directionService;
    /**
     * 查询课程分类列表
     *
     * @param category 课程分类
     * @return 课程分类
     */
    @Override
    public List<CategoryVo> selectCategoryList(Category category) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>()
                .like(StrUtil.isNotBlank(category.getName()), Category::getName, category.getName())
                .eq(category.getDirectionId() != null, Category::getDirectionId, category.getDirectionId())
                .eq(category.getStatus() != null, Category::getStatus, category.getStatus());
        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public List<Category> selectCourseListByDirectionId(Long directionId) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<Category>()
                .eq(Category::getDirectionId, directionId)
                .eq(Category::getStatus, EduFlexConstants.STATUS_ENABLED);
        return baseMapper.selectList(wrapper);
    }

    private List<CategoryVo> buildVo(List<Category> categoryList) {
        List<CategoryVo> categoryVoList = new ArrayList<>();
        for (Category category : categoryList) {
            CategoryVo categoryVo = new CategoryVo();
            BeanUtils.copyProperties(category, categoryVo);
            categoryVo.setDirectionName(directionService.getById(category.getDirectionId()).getName());
            categoryVoList.add(categoryVo);
        }
        return categoryVoList;
    }
}

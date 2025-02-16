package com.eduflex.manage.category.service;

import java.util.List;

import com.eduflex.manage.category.domain.Category;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.category.domain.vo.CategoryVo;

/**
 * 课程分类Service接口
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
public interface ICategoryService extends IService<Category> {

    /**
     * 查询课程分类列表
     *
     * @param category 课程分类
     * @return 课程分类集合
     */
    List<CategoryVo> selectCategoryList(Category category);
}

package com.eduflex.manage.category.service;

import java.util.List;

import com.eduflex.manage.category.domain.Category;
import com.baomidou.mybatisplus.extension.service.IService;

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
    public List<Category> selectCourseCategoryList(Category category);

    /**
     * 判断是否有子节点
     * @param categoryId 分类ID
     * @return 布尔值
     */
    boolean hasChildByCategoryId(Long categoryId);

    /**
     * 新增分类
     * @param category 分类
     * @return 影响条数
     */
    int insertCategory(Category category);
}

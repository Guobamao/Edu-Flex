package com.eduflex.manage.category.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.domain.vo.CategoryVo;

import java.util.List;

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
    List<Category> selectCategoryList(Category category);

    /**
     * 根据方向ID查询课程分类列表
     * @param directionId 课程方向ID
     * @return 结果
     */
    List<Category> selectCourseListByDirectionId(Long directionId);

    /**
     * 构建课程分类Vo集合
     * @param categoryList 课程分类集合
     * @return 课程分类Vo集合
     */
    List<CategoryVo> buildVo(List<Category> categoryList);
}

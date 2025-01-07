package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.CourseCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 课程分类Service接口
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
public interface ICourseCategoryService extends IService<CourseCategory> {

    /**
     * 查询课程分类列表
     *
     * @param courseCategory 课程分类
     * @return 课程分类集合
     */
    public List<CourseCategory> selectCourseCategoryList(CourseCategory courseCategory);

    /**
     * 判断是否有子节点
     * @param categoryId 分类ID
     * @return 布尔值
     */
    boolean hasChildByCategoryId(Long categoryId);

    /**
     * 新增分类
     * @param courseCategory 分类
     * @return 影响条数
     */
    int insertCategory(CourseCategory courseCategory);
}
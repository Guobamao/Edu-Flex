package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseCategoryMapper;
import com.eduflex.manage.domain.CourseCategory;
import com.eduflex.manage.service.ICourseCategoryService;

/**
 * 课程分类Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
@Service
public class CourseCategoryServiceImpl extends ServiceImpl<CourseCategoryMapper, CourseCategory> implements ICourseCategoryService {

    @Autowired
    private CourseCategoryMapper courseCategoryMapper;

    /**
     * 查询课程分类列表
     *
     * @param courseCategory 课程分类
     * @return 课程分类
     */
    @Override
    public List<CourseCategory> selectCourseCategoryList(CourseCategory courseCategory) {
        LambdaQueryWrapper<CourseCategory> wrapper = new LambdaQueryWrapper<CourseCategory>()
                .like(courseCategory.getName() != null && !courseCategory.getName().isEmpty(), CourseCategory::getName, courseCategory.getName())
                .eq(courseCategory.getParentId() != null, CourseCategory::getParentId, courseCategory.getParentId());
        return courseCategoryMapper.selectList(wrapper);
    }

    /**
     * 判断是否有子节点
     * @param categoryId 分类ID
     * @return 布尔值
     */
    @Override
    public boolean hasChildByCategoryId(Long categoryId) {
        int result = courseCategoryMapper.hasChildByCategoryId(categoryId);
        return result > 0;
    }

    /**
     * 新增分类
     * @param courseCategory 分类
     * @return 影响条数
     */
    @Override
    public int insertCategory(CourseCategory courseCategory) {
        CourseCategory info = courseCategoryMapper.selectById(courseCategory.getParentId());
        if (info != null) {
            courseCategory.setAncestors(info.getAncestors() + "," + courseCategory.getParentId());
        } else {
            courseCategory.setAncestors("0");
        }
        return courseCategoryMapper.insert(courseCategory);
    }
}

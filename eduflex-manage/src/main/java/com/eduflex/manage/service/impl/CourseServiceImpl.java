package com.eduflex.manage.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.CourseCategory;
import com.eduflex.manage.service.ICourseCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseMapper;
import com.eduflex.manage.domain.Course;
import com.eduflex.manage.service.ICourseService;

/**
 * 课程管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements ICourseService
{
    @Autowired
    private ICourseCategoryService categoryService;

    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .like(course.getName() != null && !course.getName().isEmpty(), Course::getName, course.getName())
                .ge(course.getStartTime() != null, Course::getStartTime, course.getStartTime())
                .le(course.getEndTime() != null, Course::getEndTime, course.getEndTime())
                .eq(course.getStatus() != null, Course::getStatus, course.getStatus())
                .eq(course.getTeacherId() != null, Course::getTeacherId, course.getTeacherId());

        if (course.getCategoryId() != null) {
            // 获取该分类下所有的子类，包括自身
            List<Long> categoryIds = categoryService.list().stream()
                    .filter(category -> category.getId().equals(course.getCategoryId()) || category.getAncestors().contains(course.getCategoryId().toString()))
                    .map(CourseCategory::getId).toList();
            wrapper.in(!categoryIds.isEmpty(), Course::getCategoryId, categoryIds);
        }
        return baseMapper.selectList(wrapper);
    }
}

package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.Course;
import com.eduflex.manage.domain.vo.CourseVo;

/**
 * 课程管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
public interface ICourseService extends IService<Course>
{
    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理集合
     */
    List<CourseVo> selectCourseList(Course course);
}

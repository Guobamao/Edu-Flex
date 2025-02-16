package com.eduflex.manage.course.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.dto.CourseDto;
import com.eduflex.manage.course.domain.vo.CourseVo;

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
     * @param course 课程管理
     * @return 课程管理集合
     */
    List<CourseVo> selectCourseList(Course course);

    /**
     * 根据id集合查询课程管理列表
     * @param ids id集合
     * @return 结果
     */
    List<CourseVo> selectCourseListByIds(List<Long> ids);

    /**
     * 查询课程管理列表 - 学习路线
     * @param course 条件
     * @return 结果
     */
    List<CourseVo> selectCourseListForRoute(CourseDto course);

    /**
     * 根据方向id查询课程管理列表
     * @param directionId 方向id
     * @param type 类型
     * @return 结果
     */
    List<CourseVo> selectCourseListByDirectionId(Long directionId, String type);

    /**
     * 根据方向id和分类id查询课程管理列表
     * @param directionId 方向ID
     * @param categoryId 分类ID
     * @return 结果
     */
    List<CourseVo> selectCourseListByDirectionIdAndCategoryId(Long directionId, Long categoryId);

    /**
     * 根据课程ID查询课程信息
     *
     * @param id     课程ID
     * @param userId
     * @return 课程信息
     */
    CourseVo selectCourseById(Long id, Long userId);
}

package com.eduflex.manage.course.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.dto.CourseDto;
import com.eduflex.manage.course.domain.vo.CourseVo;
import org.quartz.SchedulerException;

import java.util.List;

/**
 * 课程管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
public interface ICourseService extends IService<Course>  {
    /**
     * 查询课程管理列表
     * @param course 课程管理
     * @return 课程管理集合
     */
    List<Course> selectCourseList(Course course);

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
     * 根据课程ID查询课程信息
     * @param id  课程ID
     * @return 课程信息
     */
    CourseVo selectCourseById(Long id);

    /**
     * 查询课程相关课程
     * @param id 课程ID
     * @return 结果
     */
    List<CourseVo> listRelatedCourse(Long id);

    /**
     * 关键词搜索课程
     *
     * @param course 查询条件
     * @return 课程信息
     */
    List<Course> searchCourse(Course course);

    /**
     * 查询推荐课程
     * @return 推荐课程列表
     */
    List<CourseVo> listRecommend();

    /**
     * 查询课程列表
     * @param courseDto 查询条件
     * @return 课程列表
     */
    List<Course> selectCourseList(com.eduflex.user.course.domain.dto.CourseDto courseDto);

    /**
     * 构建课程列表 Vo 对象
     * @param courseList 课程列表
     * @return 课程列表
     */
    List<CourseVo> buildVo(List<Course> courseList);

    /**
     * 构建课程列表 Vo 对象 - 学生端
     * @param courseList 课程列表
     * @return 课程列表 Vo 对象
     */
    List<CourseVo> buildVoForStudent(List<Course> courseList);

    /**
     * 新增课程
     * @param course 课程信息
     * @return 结果
     */
    int saveCourse(Course course) throws SchedulerException, TaskException;

    /**
     * 修改课程
     * @param course 课程信息
     * @return 结果
     */
    int updateCourse(Course course) throws SchedulerException, TaskException;
}

package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.Course;
import com.eduflex.manage.domain.CourseCategory;
import com.eduflex.manage.domain.LearningRoute;
import com.eduflex.manage.domain.dto.CourseDto;
import com.eduflex.manage.domain.vo.CourseVo;
import com.eduflex.manage.mapper.CourseMapper;
import com.eduflex.manage.service.ICourseCategoryService;
import com.eduflex.manage.service.ICourseService;
import com.eduflex.manage.service.ILearningRouteService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ILearningRouteService learningRouteService;

    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理
     */
    @Override
    public List<CourseVo> selectCourseList(Course course)
    {
        // 获取course的params Map中startTime的值
        course.setStartTime(DateUtils.parseDate(course.getParams().get("startTime")));
        course.setEndTime(DateUtils.parseDate(course.getParams().get("endTime")));

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
        List<Course> courseList = baseMapper.selectList(wrapper);

        return buildVo(courseList);
    }

    @Override
    public List<CourseVo> selectCourseListByIds(List<Long> ids) {
        return buildVo(listByIds(ids));
    }

    @Override
    public List<CourseVo> selectCourseListForRoute(CourseDto course) {
        List<CourseVo> courseVos = selectCourseList(course);

        LearningRoute route = learningRouteService.getById(course.getRouteId());

        String[] split = route.getCoursesId().replace("[", "").replace("]", "").replace("\"", "").split(",");
        List<Long> coursesId = Arrays.stream(split).map(Long::parseLong).toList();

        for (CourseVo courseVo : courseVos) {
            courseVo.setIsSelected(coursesId.contains(courseVo.getId()));
        }

        return courseVos;
    }

    public List<CourseVo> buildVo(List<Course> courseList) {
        List<CourseVo> courseVoList = new ArrayList<>();
        for (Course course : courseList) {
            CourseVo courseVo = new CourseVo();
            BeanUtils.copyProperties(course, courseVo);
            courseVo.setTeacherName(userService.selectUserById(course.getTeacherId()).getNickName());
            courseVo.setCategoryName(categoryService.getById(course.getCategoryId()).getName());
            courseVoList.add(courseVo);
        }
        return courseVoList;
    }
}

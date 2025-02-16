package com.eduflex.manage.course.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.route.domain.Route;
import com.eduflex.manage.course.domain.dto.CourseDto;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course_chapter.mapper.CourseMapper;
import com.eduflex.manage.category.service.ICategoryService;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.route.service.IRouteService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.service.IStudentCourseService;
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
    private ICategoryService categoryService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IRouteService learningRouteService;

    @Autowired
    private IStudentCourseService studentCourseService;

    @Autowired
    private ICourseMaterialService courseMaterialService;

    @Autowired
    private ICourseChapterService courseChapterService;


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
                .like(StrUtil.isNotBlank(course.getName()), Course::getName, course.getName())
                .ge(course.getStartTime() != null, Course::getStartTime, course.getStartTime())
                .le(course.getEndTime() != null, Course::getEndTime, course.getEndTime())
                .eq(course.getStatus() != null, Course::getStatus, course.getStatus())
                .eq(course.getTeacherId() != null, Course::getTeacherId, course.getTeacherId());
        if (course.getCategoryId() != null) {
            // 获取该分类下所有的子类，包括自身
            List<Long> categoryIds = categoryService.list().stream()
                    .filter(category -> category.getId().equals(course.getCategoryId()))
                    .map(Category::getId).toList();
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

        if (course.getRouteId() != null) {
            Route route = learningRouteService.getById(course.getRouteId());

            String[] split = route.getCoursesId().replace("[", "").replace("]", "").replace("\"", "").split(",");
            List<Long> coursesId = Arrays.stream(split).map(Long::parseLong).toList();

            for (CourseVo courseVo : courseVos) {
                courseVo.setIsSelected(coursesId.contains(courseVo.getId()));
            }
        }

        return courseVos;
    }

    @Override
    public List<CourseVo> selectCourseListByDirectionId(Long directionId, String type) {
        Category category = new Category();
        category.setDirectionId(directionId);
        List<Long> categoryIds = categoryService.selectCategoryList(category).stream().map(Category::getId).toList();

        if (categoryIds.isEmpty()) {
            return new ArrayList<>();
        }
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .in(Course::getCategoryId, categoryIds);

        if ("new".equals(type)) {
            wrapper.orderByDesc(StrUtil.isNotBlank(type), Course::getCreateTime);
        }
        return buildVoForStudent(baseMapper.selectList(wrapper));
    }

    @Override
    public List<CourseVo> selectCourseListByDirectionIdAndCategoryId(Long directionId, Long categoryId) {
        if (directionId != null) {
            List<CourseVo> courseVoList = selectCourseListByDirectionId(directionId, "new");

            if (categoryId != null) {
                courseVoList = courseVoList.stream()
                        .filter(courseVo -> courseVo.getCategoryId()
                                .equals(categoryId))
                        .toList();
            }

            return courseVoList;
        } else {
            LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<>();
            return buildVoForStudent(baseMapper.selectList(wrapper));
        }
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

    public List<CourseVo> buildVoForStudent(List<Course> courseList) {
        List<CourseVo> courseVoList = new ArrayList<>();
        for (Course course : courseList) {
            CourseVo courseVo = new CourseVo();
            BeanUtils.copyProperties(course, courseVo);
            courseVo.setTeacherName(userService.selectUserById(course.getTeacherId()).getNickName());
            courseVo.setCategoryName(categoryService.getById(course.getCategoryId()).getName());

            // 选课人数
            LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                    .eq(StudentCourse::getCourseId, course.getId());
            courseVo.setSelectedNum((int) studentCourseService.count(wrapper));

            // 课程节数
            LambdaQueryWrapper<CourseChapter> courseChapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                    .eq(CourseChapter::getCourseId, course.getId());
            List<Long> chapterIds = courseChapterService.list(courseChapterWrapper).stream().map(CourseChapter::getId).toList();

            if (!chapterIds.isEmpty()) {
                LambdaQueryWrapper<CourseMaterial> courseMaterialWrapper = new LambdaQueryWrapper<CourseMaterial>()
                        .in(CourseMaterial::getChapterId, chapterIds)
                        // 音视频类型
                        .eq(CourseMaterial::getMaterialType, EduFlexConstants.FILE_TYPE_VIDEO_AUDIO);

                List<CourseMaterial> courseMaterialList = courseMaterialService.list(courseMaterialWrapper);
                courseVo.setVideoNum(courseMaterialList.size());

                // 课程总时长
                int videoTime = 0;
                for (CourseMaterial courseMaterial : courseMaterialList) {
                    videoTime += courseMaterial.getDuration();
                }
                courseVo.setVideoTime(videoTime);
            } else {
                courseVo.setVideoNum(0);
                courseVo.setVideoTime(0);
            }

            courseVoList.add(courseVo);
        }
        return courseVoList;
    }
}

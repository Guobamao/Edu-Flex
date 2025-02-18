package com.eduflex.manage.course.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.service.ICategoryService;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.dto.CourseDto;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.mapper.CourseMapper;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.route.domain.Route;
import com.eduflex.manage.route.service.IRouteService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.search.domain.Search;
import com.eduflex.user.search.service.ISearchService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

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

    @Autowired
    private ISearchService searchService;


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
                .eq(course.getTeacherId() != null, Course::getTeacherId, course.getTeacherId())
                .eq(course.getCategoryId() != null, Course::getCategoryId, course.getCategoryId());

        if (StrUtil.isNotBlank(course.getSearchValue())) {
            wrapper.and(q -> q.like(Course::getName, course.getSearchValue())
                    .or().like(Course::getDescription, course.getSearchValue()));
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
    public CourseVo selectCourseById(Long id, Long userId) {
        Course course = baseMapper.selectById(id);
        List<Course> courseList = new ArrayList<>();
        courseList.add(course);
        CourseVo courseVo = buildVoForStudent(courseList).get(0);
        if (userId != null) {
            LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                    .eq(StudentCourse::getCourseId, id)
                    .eq(StudentCourse::getUserId, userId);
            courseVo.setIsSelected(studentCourseService.getOne(wrapper) != null);
        }
        return courseVo;
    }

    @Override
    public List<CourseVo> listRelatedCourse(Long id) {
        Long categoryId = baseMapper.selectById(id).getCategoryId();
        // 获取同分类下的课程，并随机返回4个
        if (categoryId != null) {
            LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                    .eq(Course::getCategoryId, categoryId)
                    .ne(Course::getId, id);
            List<CourseVo> courseVos = buildVoForStudent(baseMapper.selectList(wrapper));
            Collections.shuffle(courseVos);
            return courseVos.subList(0, Math.min(courseVos.size(), 4));
        }
        return List.of();
    }

    @Override
    public List<CourseVo> searchCourse(Course course) {
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .like(StrUtil.isNotBlank(course.getSearchValue()), Course::getName, course.getSearchValue())
                .or()
                .like(StrUtil.isNotBlank(course.getSearchValue()), Course::getDescription, course.getSearchValue());

        List<CourseVo> courseVoList = buildVoForStudent(baseMapper.selectList(wrapper));
        if (!courseVoList.isEmpty()) {
            // 搜索记录
            LambdaQueryWrapper<Search> searchWrapper = new LambdaQueryWrapper<Search>()
                    .eq(Search::getSearchValue, course.getSearchValue());
            long count = searchService.count(searchWrapper);
            if (count == 0) {
                Search search = new Search();
                search.setSearchValue(course.getSearchValue());
                searchService.save(search);
            } else {
                Search search = searchService.getOne(searchWrapper);
                search.setSearchNum(search.getSearchNum() + 1);
                searchService.updateById(search);
            }
        }
        return courseVoList;
    }

    @Override
    public List<CourseVo> listRecommend() {
        // 去重课程ID，统计选课最多的课程ID
        List<Long> courseIds = studentCourseService.list().stream()
                .map(StudentCourse::getCourseId)
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()))
                .entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue())
                .limit(5)
                .map(Map.Entry::getKey)
                .toList();
        return buildVoForStudent(baseMapper.selectByIds(courseIds));
    }

    @Override
    public List<CourseVo> selectCourseList(com.eduflex.user.course.domain.dto.CourseDto courseDto) {
        if (courseDto.getDirectionId() != null) {
            List<CourseVo> courseVos = selectCourseListByDirectionId(courseDto.getDirectionId(), "new");
            if (courseDto.getCategoryId() != null) {
                courseVos = courseVos.stream()
                        .filter(courseVo -> courseVo.getCategoryId().equals(courseDto.getCategoryId()))
                        .toList();
            }
            if (courseDto.getStatus() != null) {
                courseVos = courseVos.stream()
                        .filter(courseVo -> courseVo.getStatus().equals(courseDto.getStatus()))
                        .toList();
            }

            return courseVos;
        } else {
            LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                    .eq(courseDto.getStatus() != null, Course::getStatus, courseDto.getStatus())
                    .orderByDesc(Course::getCreateTime);
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

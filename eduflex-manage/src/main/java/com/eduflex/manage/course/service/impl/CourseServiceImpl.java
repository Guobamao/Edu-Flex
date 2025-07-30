package com.eduflex.manage.course.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.category.service.ICategoryService;
import com.eduflex.manage.comment.domain.Comment;
import com.eduflex.manage.comment.service.ICommentService;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.mapper.CourseMapper;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.direction.service.IDirectionService;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.service.IExamService;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.service.IHomeworkService;
import com.eduflex.manage.paper.domain.Paper;
import com.eduflex.manage.paper.service.IPaperService;
import com.eduflex.manage.repo.domain.Repo;
import com.eduflex.manage.repo.service.IRepoService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.search.domain.Search;
import com.eduflex.user.search.service.ISearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static com.eduflex.common.utils.SecurityUtils.getUserId;

/**
 * 课程管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements ICourseService {

    @Autowired
    private IStudentCourseService studentCourseService;

    @Autowired
    private ICourseChapterService courseChapterService;

    @Autowired
    private ICourseMaterialService courseMaterialService;

    /**
     * 查询课程管理列表
     *
     * @param course 课程管理
     * @return 课程管理
     */
    @Override
    public List<Course> selectCourseList(Course course) {
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .like(StrUtil.isNotBlank(course.getName()), Course::getName, course.getName())
                .eq(course.getTeacherId() != null, Course::getTeacherId, course.getTeacherId())
                .eq(course.getCategoryId() != null, Course::getCategoryId, course.getCategoryId());

        if (StrUtil.isNotBlank(course.getSearchValue())) {
            wrapper.and(q -> q.like(Course::getName, course.getSearchValue())
                    .or().like(Course::getDescription, course.getSearchValue()));
        }
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<CourseVo> selectCourseListByIds(List<Long> ids) {
        return buildVo(listByIds(ids));
    }

    @Override
    public CourseVo selectCourseById(Long id) {
        Course course = baseMapper.selectById(id);
        if (course == null) {
            throw new ServiceException("课程不存在");
        }
        List<Course> courseList = List.of(course);
        CourseVo courseVo = buildVoForStudent(courseList).get(0);
        try {
            Long userId = getUserId();
            LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                    .eq(StudentCourse::getCourseId, id)
                    .eq(StudentCourse::getUserId, userId);
            courseVo.setIsSelected(studentCourseService.getOne(wrapper) != null);
        } catch (Exception e) {
            courseVo.setIsSelected(false);
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
    public List<Course> searchCourse(Course course) {
        ISearchService searchService = SpringUtils.getBean(ISearchService.class);
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .like(StrUtil.isNotBlank(course.getSearchValue()), Course::getName, course.getSearchValue())
                .or()
                .like(StrUtil.isNotBlank(course.getSearchValue()), Course::getDescription, course.getSearchValue());

        List<Course> courseList = baseMapper.selectList(wrapper);
        if (!courseList.isEmpty()) {
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
        return courseList;
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
    public List<Course> selectCourseList(com.eduflex.user.course.domain.dto.CourseDto courseDto) {
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<Course>()
                .eq(courseDto.getDirectionId() != null, Course::getDirectionId, courseDto.getDirectionId())
                .eq(courseDto.getCategoryId() != null, Course::getCategoryId, courseDto.getCategoryId());
        if ("new".equals(courseDto.getType())) {
            // 最新课程，按时间排序
            wrapper.orderByDesc(Course::getCreateTime);
            return baseMapper.selectList(wrapper);
        } else if ("recommend".equals(courseDto.getType())) {
            // 推荐课程
            Long userId = null;
            try {
                userId = getUserId();
            } catch (Exception ignored) {
            }
            if (userId == null) {
                // 若用户未登录，则按选课数最多的课程
                return recommendByEnrollmentCount(wrapper);
            }

            // 用户已登录，判断是否有选课记录
            List<StudentCourse> studentCourseList = studentCourseService.list(new LambdaQueryWrapper<StudentCourse>()
                    .eq(StudentCourse::getUserId, userId));

            // 若没有选课记录，则按选课人数推荐
            if (studentCourseList.isEmpty()) {
                return recommendByEnrollmentCount(wrapper);
            } else {
                List<Long> similarUserIds = findSimilarUsers(userId, studentCourseList);
                if (similarUserIds.isEmpty()) {
                    // 无相似用户，则按创建时间排序
                    wrapper.orderByDesc(Course::getCreateTime);
                    return baseMapper.selectList(wrapper);
                }
                // 推荐的课程ID
                List<Long> recommendedCourseIds = studentCourseService.list(new LambdaQueryWrapper<StudentCourse>()
                                .in(StudentCourse::getUserId, similarUserIds))
                        .stream().map(StudentCourse::getCourseId).distinct().toList();

                // 若无推荐结果，则按选课人数推荐
                if (recommendedCourseIds.isEmpty()) {
                    return recommendByEnrollmentCount(wrapper);
                } else {
                    wrapper.in(Course::getId, recommendedCourseIds);
                    return baseMapper.selectList(wrapper);
                }
            }
        }
        return baseMapper.selectList(wrapper);
    }

    private List<Long> findSimilarUsers(Long userId, List<StudentCourse> studentCourseList) {
        // 若有选课记录，则协同过滤推荐课程
        List<StudentCourse> allStudentCourses = studentCourseService.list();
        // 用户相似度
        Map<Long, Integer> userSimilarity = new HashMap<>();

        for (StudentCourse studentCourse : allStudentCourses) {
            if (!studentCourse.getUserId().equals(userId) &&
                    studentCourseList.stream().anyMatch(myStudentCourse -> myStudentCourse.getCourseId().equals(studentCourse.getCourseId()))) {
                userSimilarity.merge(studentCourse.getUserId(), 1, Integer::sum);
            }
        }

        // 相似的用户ID
        return userSimilarity.entrySet().stream()
                .sorted(Map.Entry.<Long, Integer>comparingByValue().reversed())
                .limit(5)
                .map(Map.Entry::getKey)
                .toList();
    }

    private List<Course> recommendByEnrollmentCount(LambdaQueryWrapper<Course> wrapper) {
        List<Long> courseIds = studentCourseService.list().stream()
                .collect(Collectors.groupingBy(StudentCourse::getCourseId, Collectors.counting()))
                .entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue())
                .limit(5)
                .map(Map.Entry::getKey)
                .toList();
        wrapper.in(Course::getId, courseIds);
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<CourseVo> buildVo(List<Course> courseList) {
        ICategoryService categoryService = SpringUtils.getBean(ICategoryService.class);
        ICommentService commentService = SpringUtils.getBean(ICommentService.class);
        ISysUserService userService = SpringUtils.getBean(ISysUserService.class);
        IDirectionService directionService = SpringUtils.getBean(IDirectionService.class);
        IEvaluationService evaluationService = SpringUtils.getBean(IEvaluationService.class);
        IExamService examService = SpringUtils.getBean(IExamService.class);
        IHomeworkService homeworkService = SpringUtils.getBean(IHomeworkService.class);
        IPaperService paperService = SpringUtils.getBean(IPaperService.class);
        IRepoService repoService = SpringUtils.getBean(IRepoService.class);
        List<CourseVo> courseVoList = new ArrayList<>();
        for (Course course : courseList) {
            CourseVo courseVo = new CourseVo();
            BeanUtils.copyProperties(course, courseVo);
            courseVo.setTeacherName(userService.selectUserById(course.getTeacherId()).getNickName());
            courseVo.setDirectionName(directionService.getById(course.getDirectionId()).getName());
            courseVo.setCategoryName(categoryService.getById(course.getCategoryId()).getName());
            courseVo.setSelectedNum((int) studentCourseService.count(new LambdaQueryWrapper<StudentCourse>()
                    .eq(StudentCourse::getCourseId, course.getId())));
            List<Evaluation> evaluationList = evaluationService.list(new LambdaQueryWrapper<Evaluation>().eq(Evaluation::getCourseId, course.getId()));
            evaluationList.stream().mapToDouble(Evaluation::getScore).average().ifPresent(courseVo::setAvgScore);

            List<CourseChapter> courseChapterList = courseChapterService.list(new LambdaQueryWrapper<CourseChapter>().eq(CourseChapter::getCourseId, course.getId()));
            if (courseChapterList.isEmpty()) {
                courseVo.setResourceNum(0);
            } else {
                List<Long> chapterIdList = courseChapterList.stream().map(CourseChapter::getId).toList();

                LambdaQueryWrapper<CourseMaterial> materialLambdaQueryWrapper = new LambdaQueryWrapper<CourseMaterial>()
                        .in(CourseMaterial::getChapterId, chapterIdList);
                courseVo.setResourceNum((int) courseMaterialService.count(materialLambdaQueryWrapper));
            }

            courseVo.setCommentNum((int) commentService.count(Wrappers.<Comment>lambdaQuery().eq(Comment::getCourseId, course.getId())));
            courseVo.setEvaluationNum((int) evaluationService.count(Wrappers.<Evaluation>lambdaQuery().eq(Evaluation::getCourseId, course.getId())));
            courseVo.setExamNum((int) examService.count(Wrappers.<Exam>lambdaQuery().eq(Exam::getCourseId, course.getId())));
            courseVo.setHomeworkNum((int) homeworkService.count(Wrappers.<Homework>lambdaQuery().eq(Homework::getCourseId, course.getId())));
            courseVo.setPaperNum((int) paperService.count(Wrappers.<Paper>lambdaQuery().eq(Paper::getCourseId, course.getId())));
            courseVo.setRepoNum((int) repoService.count(Wrappers.<Repo>lambdaQuery().eq(Repo::getCourseId, course.getId())));
            courseVoList.add(courseVo);
        }
        return courseVoList;
    }

    @Override
    public List<CourseVo> buildVoForStudent(List<Course> courseList) {
        ICategoryService categoryService = SpringUtils.getBean(ICategoryService.class);
        ISysUserService userService = SpringUtils.getBean(ISysUserService.class);
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

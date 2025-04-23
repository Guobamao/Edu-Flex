package com.eduflex.manage.homework.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.domain.HomeworkStudent;
import com.eduflex.manage.homework.mapper.HomeworkStudentMapper;
import com.eduflex.manage.homework.service.IHomeworkService;
import com.eduflex.manage.homework.service.IHomeworkStudentService;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.user.homework.domain.dto.HomeworkDto;
import com.eduflex.user.homework.domain.vo.UserHomeworkVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.eduflex.common.utils.SecurityUtils.getUsername;


/**
 * 作业学生关联 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-18
 */
@Service
public class HomeworkStudentServiceImpl extends ServiceImpl<HomeworkStudentMapper, HomeworkStudent> implements IHomeworkStudentService {

    @Autowired
    private IStudentCourseService studentCourseService;

    @Autowired
    private IHomeworkService homeworkService;

    @Autowired
    private ICourseService courseService;

    @Override
    public List<UserHomeworkVo> selectHomeworkList(HomeworkDto homework) {
        // 获取学生已选课程ID
        StudentCourseDto studentCourse = new StudentCourseDto();
        studentCourse.setUserId(homework.getUserId());

        if (homework.getCourseId() != null) {
            studentCourse.setCourseId(homework.getCourseId());
        }

        List<StudentCourseVo> studentCourseVos = studentCourseService.buildVo(studentCourseService.selectStudentCourseList(studentCourse));
        List<Long> courseIds = studentCourseVos.stream().map(StudentCourseVo::getCourseId).toList();

        // 查询课程下的作业
        if (!courseIds.isEmpty()) {
            LambdaQueryWrapper<Homework> homeworkWrapper = new LambdaQueryWrapper<Homework>()
                    .in(Homework::getCourseId, courseIds)
                    .orderByDesc(Homework::getCreateTime);
            List<Homework> homeworkList = homeworkService.list(homeworkWrapper);

            return homeworkList.stream().map(v -> {
                UserHomeworkVo userHomeworkVo = new UserHomeworkVo();
                userHomeworkVo.setCourseId(v.getCourseId());
                userHomeworkVo.setHomeworkId(v.getId());
                userHomeworkVo.setTitle(v.getTitle());
                userHomeworkVo.setContent(v.getContent());
                userHomeworkVo.setCourseName(courseService.getById(v.getCourseId()).getName());

                LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                        .eq(HomeworkStudent::getUserId, homework.getUserId())
                        .eq(HomeworkStudent::getHomeworkId, v.getId());
                HomeworkStudent homeworkStudent = getOne(wrapper);
                if (homeworkStudent != null) {
                    userHomeworkVo.setStatus(homeworkStudent.getStatus());
                    userHomeworkVo.setSubmitTime(homeworkStudent.getSubmitTime());
                } else {
                    userHomeworkVo.setStatus(EduFlexConstants.HOMEWORK_STATUS_UNDO);
                    userHomeworkVo.setSubmitTime(null);
                }
                return userHomeworkVo;
            }).toList();
        }
        return List.of();
    }

    @Override
    public UserHomeworkVo selectHomework(HomeworkDto homeworkDto) {
        LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                .eq(HomeworkStudent::getUserId, homeworkDto.getUserId())
                .eq(HomeworkStudent::getHomeworkId, homeworkDto.getHomeworkId());
        // 获取学生作业记录
        HomeworkStudent homeworkStudent = baseMapper.selectOne(wrapper);

        UserHomeworkVo userHomeworkVo = new UserHomeworkVo();

        Homework homework = homeworkService.getById(homeworkDto.getHomeworkId());
        if (homework == null) {
            throw new ServiceException("作业不存在");
        }
        Course course = courseService.getById(homework.getCourseId());

        userHomeworkVo.setHomeworkId(homeworkDto.getHomeworkId());
        userHomeworkVo.setCourseId(homework.getCourseId());
        userHomeworkVo.setCourseName(course.getName());
        userHomeworkVo.setTitle(homework.getTitle());
        userHomeworkVo.setContent(homework.getContent());

        if (homeworkStudent != null) {
            userHomeworkVo.setAnswer(homeworkStudent.getAnswer());
            userHomeworkVo.setSubmitTime(homeworkStudent.getSubmitTime());
            userHomeworkVo.setStatus(homeworkStudent.getStatus());
        } else {
            userHomeworkVo.setAnswer(null);
            userHomeworkVo.setSubmitTime(null);
            userHomeworkVo.setStatus(EduFlexConstants.HOMEWORK_STATUS_UNDO);
        }

        return userHomeworkVo;
    }

    @Override
    public boolean submitHomework(HomeworkDto homeworkDto) {
        // 检查是否存在记录
        LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                .eq(HomeworkStudent::getUserId, homeworkDto.getUserId())
                .eq(HomeworkStudent::getHomeworkId, homeworkDto.getHomeworkId());
        if (baseMapper.selectOne(wrapper) == null) {
            // 记录不存在，创建记录
            HomeworkStudent homeworkStudent = new HomeworkStudent();
            homeworkStudent.setUserId(homeworkDto.getUserId());
            homeworkStudent.setHomeworkId(homeworkDto.getHomeworkId());
            homeworkStudent.setAnswer(homeworkDto.getAnswer());
            homeworkStudent.setSubmitTime(DateUtils.getNowDate());
            homeworkStudent.setStatus(EduFlexConstants.HOMEWORK_STATUS_PENDING);
            homeworkStudent.setCreateBy(getUsername());
            return baseMapper.insert(homeworkStudent) > 0;
        } else {
            LambdaUpdateWrapper<HomeworkStudent> updateWrapper = new LambdaUpdateWrapper<HomeworkStudent>()
                    .eq(HomeworkStudent::getUserId, homeworkDto.getUserId())
                    .eq(HomeworkStudent::getHomeworkId, homeworkDto.getHomeworkId())
                    .set(HomeworkStudent::getAnswer, homeworkDto.getAnswer())
                    .set(HomeworkStudent::getSubmitTime, DateUtils.getNowDate())
                    .set(HomeworkStudent::getStatus, EduFlexConstants.HOMEWORK_STATUS_PENDING)
                    .set(HomeworkStudent::getUpdateBy, getUsername());
            return baseMapper.update(null, updateWrapper) > 0;
        }
    }
}

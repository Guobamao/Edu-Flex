package com.eduflex.manage.homework.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
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
import com.eduflex.user.homework.domain.vo.HomeworkVo;
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
    public List<HomeworkVo> selectHomeworkList(HomeworkDto homework) {
        // 获取学生已选课程ID
        StudentCourseDto studentCourse = new StudentCourseDto();
        studentCourse.setUserId(homework.getUserId());

        if (homework.getCourseId() != null) {
            studentCourse.setCourseId(homework.getCourseId());
        }

        List<StudentCourseVo> studentCourseVos = studentCourseService.selectStudentCourseList(studentCourse);
        List<Long> courseIds = studentCourseVos.stream().map(StudentCourseVo::getCourseId).toList();

        // 查询课程下的作业
        if (!courseIds.isEmpty()) {
            LambdaQueryWrapper<Homework> homeworkWrapper = new LambdaQueryWrapper<Homework>()
                    .in(Homework::getCourseId, courseIds)
                    .orderByDesc(Homework::getCreateTime);
            List<Homework> homeworkList = homeworkService.list(homeworkWrapper);

            return homeworkList.stream().map(v -> {
                HomeworkVo homeworkVo = new HomeworkVo();
                homeworkVo.setCourseId(v.getCourseId());
                homeworkVo.setHomeworkId(v.getId());
                homeworkVo.setTitle(v.getTitle());
                homeworkVo.setContent(v.getContent());
                homeworkVo.setDeadline(v.getDeadline());
                homeworkVo.setCourseName(courseService.getById(v.getCourseId()).getName());

                LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                        .eq(HomeworkStudent::getUserId, homework.getUserId())
                        .eq(HomeworkStudent::getHomeworkId, v.getId());
                HomeworkStudent homeworkStudent = getOne(wrapper);
                if (homeworkStudent != null) {
                    homeworkVo.setHomeworkStatus(homeworkStudent.getStatus());
                    homeworkVo.setSubmitTime(homeworkStudent.getSubmitTime());
                } else {
                    homeworkVo.setHomeworkStatus(EduFlexConstants.HOMEWORK_STATUS_UNDO);
                    homeworkVo.setSubmitTime(null);
                }
                if (DateUtils.getNowDate().after(v.getDeadline())) {
                    // 超时，显示已结束
                    homeworkVo.setStatus(EduFlexConstants.STATUS_ENDED);
                } else {
                    homeworkVo.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
                }
                return homeworkVo;
            }).toList();
        }
        return List.of();
    }

    @Override
    public HomeworkVo selectHomework(HomeworkDto homeworkDto) {
        LambdaQueryWrapper<HomeworkStudent> wrapper = new LambdaQueryWrapper<HomeworkStudent>()
                .eq(HomeworkStudent::getUserId, homeworkDto.getUserId())
                .eq(HomeworkStudent::getHomeworkId, homeworkDto.getHomeworkId());
        // 获取学生作业记录
        HomeworkStudent homeworkStudent = baseMapper.selectOne(wrapper);
        HomeworkVo homeworkVo = new HomeworkVo();

        Homework homework = homeworkService.getById(homeworkDto.getHomeworkId());
        Course course = courseService.getById(homework.getCourseId());

        homeworkVo.setHomeworkId(homeworkDto.getHomeworkId());
        homeworkVo.setCourseId(homework.getCourseId());
        homeworkVo.setCourseName(course.getName());
        homeworkVo.setTitle(homework.getTitle());
        homeworkVo.setContent(homework.getContent());
        homeworkVo.setDeadline(homework.getDeadline());

        if (homeworkStudent != null) {
            homeworkVo.setAnswer(homeworkStudent.getAnswer());
            homeworkVo.setSubmitTime(homeworkStudent.getSubmitTime());
            homeworkVo.setHomeworkStatus(homeworkStudent.getStatus());
        } else {
            homeworkVo.setAnswer(null);
            homeworkVo.setSubmitTime(null);
            homeworkVo.setHomeworkStatus(EduFlexConstants.HOMEWORK_STATUS_UNDO);
        }
        if (DateUtils.getNowDate().after(homework.getDeadline())) {
            // 超时，显示已结束
            homeworkVo.setStatus(EduFlexConstants.STATUS_ENDED);
        } else {
            homeworkVo.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
        }

        return homeworkVo;
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

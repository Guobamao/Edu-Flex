package com.eduflex.manage.homework.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
                    .in(Homework::getCourseId, courseIds);
            List<Homework> homeworkList = homeworkService.list(homeworkWrapper);

            return homeworkList.stream().map(v -> {
                HomeworkVo homeworkVo = new HomeworkVo();
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
                    homeworkVo.setStatus(homeworkStudent.getStatus());
                    homeworkVo.setSubmitTime(homeworkStudent.getSubmitTime());
                } else {
                    homeworkVo.setStatus(0);
                    homeworkVo.setSubmitTime(null);
                }
                return homeworkVo;
            }).toList();
        }
        return List.of();
    }
}

package com.eduflex.manage.student.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;
import com.eduflex.manage.student.mapper.StudentCourseMapper;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生选课Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
@Service
public class StudentCourseServiceImpl extends ServiceImpl<StudentCourseMapper, StudentCourse> implements IStudentCourseService {

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ICourseChapterService courseChapterService;

    @Override
    public List<StudentCourse> selectStudentCourseList(StudentCourseDto studentCourseDto) {
        LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                .eq(studentCourseDto.getUserId() != null, StudentCourse::getUserId, studentCourseDto.getUserId())
                .eq(studentCourseDto.getCourseId() != null, StudentCourse::getCourseId, studentCourseDto.getCourseId())
                .eq(studentCourseDto.getStatus() != null, StudentCourse::getStatus, studentCourseDto.getStatus());
        if (studentCourseDto.getProgressList() != null) {
            wrapper.between(StudentCourse::getProgress, studentCourseDto.getProgressList().get(0), studentCourseDto.getProgressList().get(1));
        }
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<StudentCourseVo> buildVo(List<StudentCourse> studentCourses) {
        ICourseService courseService = SpringUtils.getBean(ICourseService.class);
        List<StudentCourseVo> studentCourseVos = new ArrayList<>();
        for (StudentCourse studentCourse : studentCourses) {
            StudentCourseVo studentCourseVo = new StudentCourseVo();
            BeanUtils.copyProperties(studentCourse, studentCourseVo);

            SysUser sysUser = sysUserService.selectUserById(studentCourse.getUserId());
            studentCourseVo.setUserName(sysUser.getUserName());
            studentCourseVo.setNickName(sysUser.getNickName());

            Course course = courseService.getById(studentCourse.getCourseId());
            studentCourseVo.setCourseName(course.getName());
            studentCourseVo.setCover(course.getCover());

            CourseChapterDto courseChapterDto = new CourseChapterDto();
            courseChapterDto.setUserId(studentCourse.getUserId());
            courseChapterDto.setCourseId(course.getId());
            List<CourseChapterVo> courseChapterVos = courseChapterService.selectCourseChapterListWithProgress(courseChapterDto);
            // 对每一项的progress相加，处理总数size,使用stream
            int progress = courseChapterVos.stream().mapToInt(CourseChapterVo::getProgress).sum();
            studentCourseVo.setProgress(progress / courseChapterVos.size());

            studentCourseVos.add(studentCourseVo);
        }
        return studentCourseVos;
    }

    @Override
    public StudentCourseVo getInfoById(Long id) {
        StudentCourse studentCourse = baseMapper.selectById(id);
        StudentCourseVo studentCourseVo = new StudentCourseVo();
        BeanUtils.copyProperties(studentCourse, studentCourseVo);

        SysUser sysUser = sysUserService.selectUserById(studentCourse.getUserId());
        studentCourseVo.setUserName(sysUser.getUserName());
        studentCourseVo.setNickName(sysUser.getNickName());
        return studentCourseVo;
    }

    @Override
    public int removeByUserIdAndCourseId(Long userId, Long courseId) {
        LambdaQueryWrapper<StudentCourse> wrapper = new LambdaQueryWrapper<StudentCourse>()
                .eq(StudentCourse::getUserId, userId)
                .eq(StudentCourse::getCourseId, courseId);
        return baseMapper.delete(wrapper);
    }
}

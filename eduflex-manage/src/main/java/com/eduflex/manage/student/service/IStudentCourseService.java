package com.eduflex.manage.student.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;

import java.util.List;

/**
 * 学生选课Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
public interface IStudentCourseService extends IService<StudentCourse> {
    /**
     * 查询学生选课列表
     *
     * @param studentCourseDto 学生选课
     * @return 学生选课集合
     */
    List<StudentCourse> selectStudentCourseList(StudentCourseDto studentCourseDto);


    /**
     * 根据id查询学生选课信息
     * @param id ID
     * @return 学生选课VO对象
     */
    StudentCourseVo getInfoById(Long id);

    /**
     * 根据用户ID和课程ID删除学生选课信息
     * @param userId 用户ID
     * @param courseId 学生ID
     * @return
     */
    int removeByUserIdAndCourseId(Long userId, Long courseId);

    /**
     * 构建学生选课VO集合
     * @param studentCourses 学生选课集合
     * @return 学生选课VO集合
     */
    List<StudentCourseVo> buildVo(List<StudentCourse> studentCourses);
}

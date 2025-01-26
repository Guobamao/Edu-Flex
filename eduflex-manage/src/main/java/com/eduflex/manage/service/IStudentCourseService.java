package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.StudentCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.dto.StudentCourseDto;
import com.eduflex.manage.domain.vo.StudentCourseVo;

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
    List<StudentCourseVo> selectStudentCourseList(StudentCourseDto studentCourseDto);


    /**
     * 根据id查询学生选课信息
     * @param id ID
     * @return 学生选课VO对象
     */
    StudentCourseVo getInfoById(Long id);
}

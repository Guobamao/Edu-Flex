package com.eduflex.user.student.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.user.student.controller.domain.dto.StudentCourseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 学生选课 Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserStudentCourseController")
@RequestMapping("/user/student_course")
public class StudentCourseController extends BaseController {

    @Autowired
    private IStudentCourseService studentCourseService;

    @PreAuthorize("@ss.hasRole('teacher')")
    @PostMapping
    public AjaxResult saveOrDelete(@RequestBody StudentCourseDto studentCourse) {
        studentCourse.setUserId(getUserId());
        studentCourse.setCreateBy(getUsername());
        if (studentCourse.getIsSelected()) {
            return toAjax(studentCourseService.saveOrUpdate(studentCourse));
        } else {
            return toAjax(studentCourseService.removeByUserIdAndCourseId(studentCourse.getUserId(), studentCourse.getCourseId()));
        }
    }
}

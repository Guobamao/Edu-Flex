package com.eduflex.user.student.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    /**
     * 选课 / 推选
     * @param studentCourse 选课条件
     * @return 结果
     */
    @PreAuthorize("@ss.hasRole('student')")
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

    /**
     * 查询学生选课列表
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(StudentCourseDto studentCourseDto) {
        startPage();
        studentCourseDto.setUserId(getUserId());
        PageInfo<StudentCourse> pageInfo = new PageInfo<>(studentCourseService.selectStudentCourseList(studentCourseDto));
        List<StudentCourseVo> list = studentCourseService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }
}

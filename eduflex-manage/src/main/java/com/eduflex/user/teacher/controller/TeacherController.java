package com.eduflex.user.teacher.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.teacher.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户端 - 教师 Controller
 *
 * @author 林煜鋒
 * @date 2025-02-17
 */
@RestController(value = "UserTeacherController")
@RequestMapping("/user/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private ITeacherService teacherService;

    @GetMapping("/{id}")
    public AjaxResult getTeacherInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(teacherService.selectTeacherById(id));
    }
}

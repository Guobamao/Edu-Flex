package com.eduflex.user.course_material.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 用户端 - 课程资料Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserCourseMaterialController")
@RequestMapping("/user/material")
public class CourseMaterialController extends BaseController {

    @Autowired
    private ICourseMaterialService courseMaterialService;

    @GetMapping("/list")
    public AjaxResult list(CourseMaterial courseMaterial) {
        List<CourseMaterial> list = courseMaterialService.selectCourseMaterialList(courseMaterial);
        return success(list);
    }
}

package com.eduflex.user.course_material.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.user.course_material.domain.dto.CourseMaterialDto;
import com.eduflex.user.course_material.domain.vo.CourseMaterialVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    /**
     * 获取课程资料
     * @param courseMaterialDto 查询条件
     * @return 课程资料列表
     */
    @GetMapping("/list")
    public AjaxResult list(CourseMaterialDto courseMaterialDto) {
        try {
            courseMaterialDto.setUserId(getUserId());
            List<CourseMaterialVo> list = courseMaterialService.selectCourseMaterialListWithProgress(courseMaterialDto);
            return success(list);
        } catch (Exception e) {
            CourseMaterial courseMaterial = new CourseMaterial();
            BeanUtils.copyProperties(courseMaterialDto, courseMaterial);
            List<CourseMaterial> list = courseMaterialService.selectCourseMaterialList(courseMaterial);
            return success(list);
        }
    }


    /**
     * 获取课程资料详情
     * @param id 课程资料ID
     * @return 课程资料详情
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/{id}")
    public AjaxResult getMaterialInfo(@PathVariable("id") Long id) {
        return success(courseMaterialService.selectById(id));
    }
}

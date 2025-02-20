package com.eduflex.user.category.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.category.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 课程分类 - 用户端Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserCategoryController")
@RequestMapping("/user/category")
public class CategoryController extends BaseController {

    @Autowired
    private ICategoryService categoryService;

    /**
     * 根据方向ID查询课程分类
     * @param directionId 方向ID
     * @return 课程分类列表
     */
    @GetMapping("/listByDirection")
    public AjaxResult list(@RequestParam Long directionId) {
        return success(categoryService.selectCourseListByDirectionId(directionId));
    }
}

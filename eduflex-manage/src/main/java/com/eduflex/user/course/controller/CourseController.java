package com.eduflex.user.course.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 课程 - 用户端Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserCourseController")
@RequestMapping("/user/course")
public class CourseController extends BaseController {

    @Autowired
    private ICourseService courseService;

    @GetMapping("/listByDirection")
    public AjaxResult list(@RequestParam Long directionId, @RequestParam String type) {
        return success(courseService.selectCourseListByDirectionId(directionId, type));
    }

    @GetMapping("/list")
    public TableDataInfo list(Long directionId, Long categoryId) {
        startPage();
        List<CourseVo> list = courseService.selectCourseListByDirectionIdAndCategoryId(directionId, categoryId);
        return getDataTable(list);
    }

    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        try {
            return success(courseService.selectCourseById(id, getUserId()));
        } catch (Exception e) {
            return success(courseService.selectCourseById(id, null));
        }
    }
}

package com.eduflex.user.course.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.user.course.domain.dto.CourseDto;
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
    public TableDataInfo list(CourseDto courseDto) {
        startPage();
        List<CourseVo> list = courseService.selectCourseList(courseDto);
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

    @GetMapping("/listRelatedCourse/{id}")
    public AjaxResult listRelatedCourse(@PathVariable("id") Long id) {
        return success(courseService.listRelatedCourse(id));
    }

    @GetMapping("/search")
    public TableDataInfo search(Course course) {
        startPage();
        List<CourseVo> list = courseService.searchCourse(course);
        return getDataTable(list);
    }

    @GetMapping("/listRecommend")
    public AjaxResult listRecommend() {
        return success(courseService.listRecommend());
    }
}

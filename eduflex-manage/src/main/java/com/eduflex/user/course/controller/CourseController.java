package com.eduflex.user.course.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.user.course.domain.dto.CourseDto;
import com.github.pagehelper.PageInfo;
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

    /**
     * 通过课程方向查询课程列表
     * @param directionId 课程方向ID
     * @param type 类型（new / recommend)
     * @return 课程列表
     */
    @GetMapping("/listByDirection")
    public AjaxResult list(@RequestParam Long directionId, @RequestParam String type) {
        return success(courseService.selectCourseListByDirectionId(directionId, type));
    }

    /**
     * 查询课程列表
     * @param courseDto 查询条件
     * @return 课程列表
     */
    @GetMapping("/list")
    public TableDataInfo list(CourseDto courseDto) {
        startPage();
        PageInfo<Course> pageInfo = new PageInfo<>(courseService.selectCourseList(courseDto));
        List<CourseVo> courseVoList = courseService.buildVoForStudent(pageInfo.getList());
        return getDataTable(courseVoList, pageInfo.getTotal());
    }

    /**
     * 获取课程详细信息
     * @param id 课程ID
     * @return 课程信息
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        try {
            return success(courseService.selectCourseById(id, getUserId()));
        } catch (Exception e) {
            return success(courseService.selectCourseById(id, null));
        }
    }

    /**
     * 相关课程列表
     * @param id 课程ID
     * @return 课程列表
     */
    @GetMapping("/listRelatedCourse/{id}")
    public AjaxResult listRelatedCourse(@PathVariable("id") Long id) {
        return success(courseService.listRelatedCourse(id));
    }

    /**
     * 关键词搜索课程
     * @param course 查询条件
     * @return 课程列表
     */
    @GetMapping("/search")
    public TableDataInfo search(Course course) {
        startPage();
        PageInfo<Course> pageInfo = new PageInfo<>(courseService.searchCourse(course));
        List<CourseVo> list = courseService.buildVoForStudent(pageInfo.getList());
        return getDataTable(list);
    }

    /**
     * 获取推荐课程列表
     * @return 推荐课程列表
     */
    @GetMapping("/listRecommend")
    public AjaxResult listRecommend() {
        return success(courseService.listRecommend());
    }
}

package com.eduflex.manage.course.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.domain.model.LoginUser;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.domain.vo.CourseVo;
import com.eduflex.manage.course.service.ICourseService;
import com.github.pagehelper.PageInfo;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 课程管理Controller
 *
 * @author 林煜鋒
 * @date 2024-10-10
 */
@RestController
@RequestMapping("/manage/course")
public class CourseController extends BaseController
{
    @Autowired
    private ICourseService courseService;

    /**
     * 查询课程管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Course course)
    {
        // 获取当前登录用户信息
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 获取当前登录用户对象
        SysUser currentUser = loginUser.getUser();

        // 判断当前用户是否为管理员
        if (!currentUser.isAdmin()) {
            // 若不是管理员角色，则只能查看教师自己的课程
            course.setTeacherId(currentUser.getUserId());
        }

        startPage();
        PageInfo<Course> pageInfo = new PageInfo<>(courseService.selectCourseList(course));
        List<CourseVo> list = courseService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出课程管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Course course)
    {
        List<CourseVo> list = courseService.buildVo(courseService.selectCourseList(course));
        ExcelUtil<CourseVo> util = new ExcelUtil<>(CourseVo.class);
        util.exportExcel(response, list, "课程管理数据");
    }

    /**
     * 获取课程管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseService.getById(id));
    }

    @PreAuthorize("@ss.hasRole('admin')")
    @PostMapping("/listByIds")
    public AjaxResult getInfoByIds(@RequestBody List<Long> ids) {
        return success(courseService.selectCourseListByIds(ids));
    }
    /**
     * 新增课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Course course) throws SchedulerException, TaskException {
        course.setCreateBy(getUsername());
        return toAjax(courseService.saveCourse(course));
    }

    /**
     * 修改课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Course course) throws SchedulerException, TaskException {
        course.setUpdateBy(getUsername());
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 删除课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        // 数组改成列表
        ArrayList<Long> idList = CollUtil.toList(ids);
        return toAjax(courseService.removeByIds(idList));
    }
}

package com.eduflex.manage.student.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学生选课 Controller
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
@RestController
@RequestMapping("/manage/student_course")
public class StudentCourseController extends BaseController {

    @Autowired
    private IStudentCourseService studentCourseService;

    /**
     * 查询学生选课列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(StudentCourseDto studentCourseDto) {
        startPage();
        PageInfo<StudentCourse> pageInfo = new PageInfo<>(studentCourseService.selectStudentCourseList(studentCourseDto));
        List<StudentCourseVo> list = studentCourseService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出学生选课列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学生选课", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudentCourseDto studentCourseDto) {
        List<StudentCourseVo> list = studentCourseService.buildVo(studentCourseService.selectStudentCourseList(studentCourseDto));
        ExcelUtil<StudentCourseVo> util = new ExcelUtil<>(StudentCourseVo.class);
        util.exportExcel(response, list, "学生选课数据");
    }

    /**
     * 获取学生选课详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(studentCourseService.getInfoById(id));
    }

    /**
     * 新增学生选课
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学生选课", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudentCourse studentCourse) {
        studentCourse.setCreateBy(getUsername());
        studentCourse.setCreateTime(DateUtils.getNowDate());
        return toAjax(studentCourseService.save(studentCourse));
    }

    /**
     * 修改学生选课
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学生选课", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudentCourse studentCourse) {
        studentCourse.setUpdateBy(getUsername());
        studentCourse.setUpdateTime(DateUtils.getNowDate());
        return toAjax(studentCourseService.updateById(studentCourse));
    }

    /**
     * 删除学生选课
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学生选课", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(studentCourseService.removeByIds(idList));
    }
}

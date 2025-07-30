package com.eduflex.manage.homework.controller;

import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.homework.domain.HomeworkStudent;
import com.eduflex.manage.homework.domain.vo.HomeworkStudentVo;
import com.eduflex.manage.homework.service.IHomeworkStudentService;
import com.eduflex.user.homework.domain.dto.HomeworkDto;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/manage/student_homework")
public class StudentHomeworkController extends BaseController {

    @Autowired
    private IHomeworkStudentService homeworkStudentService;

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkDto homeworkDto) {
        startPage();
        PageInfo<HomeworkStudent> pageInfo = new PageInfo<>(homeworkStudentService.selectHomeworkStudentList(homeworkDto));
        List<HomeworkStudentVo> list = homeworkStudentService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(homeworkStudentService.getById(id));
    }

    /**
     * 批阅作业
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "批阅作业", businessType = BusinessType.UPDATE)
    @PutMapping("/check")
    public AjaxResult check(@RequestBody HomeworkStudent homeworkStudent) {
        homeworkStudent.setUpdateBy(getUsername());
        return toAjax(homeworkStudentService.checkHomework(homeworkStudent));
    }

    /**
     * 导出作业管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学生作业管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HomeworkDto homeworkDto) {
        List<HomeworkStudentVo> list = homeworkStudentService.buildVo(homeworkStudentService.selectHomeworkStudentList(homeworkDto));
        ExcelUtil<HomeworkStudentVo> util = new ExcelUtil<HomeworkStudentVo>(HomeworkStudentVo.class);
        util.exportExcel(response, list, "学生作业数据");
    }
}

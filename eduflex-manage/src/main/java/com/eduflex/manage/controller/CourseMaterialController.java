package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.manage.domain.CourseMaterial;
import com.eduflex.manage.service.ICourseMaterialService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 课程资料Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
@RestController
@RequestMapping("/manage/material")
public class CourseMaterialController extends BaseController
{
    @Autowired
    private ICourseMaterialService courseMaterialService;

    /**
     * 查询课程资料列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(CourseMaterial courseMaterial)
    {
        startPage();
        List<CourseMaterial> list = courseMaterialService.selectCourseMaterialList(courseMaterial);
        return getDataTable(list);
    }

    /**
     * 导出课程资料列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程资料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseMaterial courseMaterial)
    {
        List<CourseMaterial> list = courseMaterialService.selectCourseMaterialList(courseMaterial);
        ExcelUtil<CourseMaterial> util = new ExcelUtil<>(CourseMaterial.class);
        util.exportExcel(response, list, "课程资料数据");
    }

    /**
     * 获取课程资料详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseMaterialService.selectCourseMaterialById(id));
    }

    /**
     * 新增课程资料
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程资料", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseMaterial courseMaterial)
    {
        return toAjax(courseMaterialService.insertCourseMaterial(courseMaterial));
    }

    /**
     * 修改课程资料
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程资料", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseMaterial courseMaterial)
    {
        return toAjax(courseMaterialService.updateCourseMaterial(courseMaterial));
    }

    /**
     * 删除课程资料
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程资料", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(courseMaterialService.deleteCourseMaterialByIds(ids));
    }
}

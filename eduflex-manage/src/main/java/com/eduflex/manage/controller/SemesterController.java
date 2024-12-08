package com.eduflex.manage.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
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
import com.eduflex.manage.domain.Semester;
import com.eduflex.manage.service.ISemesterService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学期管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@RestController
@RequestMapping("/manage/semester")
public class SemesterController extends BaseController
{
    @Autowired
    private ISemesterService semesterService;

    /**
     * 查询学期管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(Semester semester)
    {
        startPage();
        List<Semester> list = semesterService.selectSemesterList(semester);
        return getDataTable(list);
    }

    /**
     * 导出学期管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学期管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Semester semester)
    {
        List<Semester> list = semesterService.selectSemesterList(semester);
        ExcelUtil<Semester> util = new ExcelUtil<>(Semester.class);
        util.exportExcel(response, list, "学期管理数据");
    }

    /**
     * 获取学期管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(semesterService.getById(id));
    }

    /**
     * 新增学期管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学期管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Semester semester)
    {
        semester.setCreateBy(getUsername());
        semester.setCreateTime(DateUtils.getNowDate());
        return toAjax(semesterService.save(semester));
    }

    /**
     * 修改学期管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学期管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Semester semester)
    {
        semester.setUpdateBy(getUsername());
        semester.setUpdateTime(DateUtils.getNowDate());
        return toAjax(semesterService.updateById(semester));
    }

    /**
     * 删除学期管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学期管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        ArrayList<Long> idList = CollUtil.toList(ids);
        return toAjax(semesterService.removeByIds(idList));
    }
}

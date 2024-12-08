package com.eduflex.manage.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.dto.CourseGradeDto;
import com.eduflex.manage.domain.vo.CourseGradeVo;
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
import com.eduflex.manage.domain.CourseGrade;
import com.eduflex.manage.service.ICourseGradeService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 班级课程管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
@RestController
@RequestMapping("/manage/courseGrade")
public class CourseGradeController extends BaseController
{
    @Autowired
    private ICourseGradeService courseGradeService;

    /**
     * 查询班级课程管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(CourseGradeDto courseGradeDto)
    {
        startPage();
        List<CourseGradeVo> list = courseGradeService.selectCourseGradeList(courseGradeDto);
        return getDataTable(list);
    }

    /**
     * 导出班级课程管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级课程管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseGradeDto courseGradeDto)
    {
        List<CourseGradeVo> list = courseGradeService.selectCourseGradeList(courseGradeDto);
        ExcelUtil<CourseGradeVo> util = new ExcelUtil<>(CourseGradeVo.class);
        util.exportExcel(response, list, "班级课程管理数据");
    }

    /**
     * 获取班级课程管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseGradeService.selectCourseGradeById(id));
    }

    /**
     * 新增班级课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级课程管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseGrade courseGrade)
    {
        // 判断是否重复
        if (courseGradeService.selectCourseGradeByGradeIdAndCourseId(courseGrade)) {
            return AjaxResult.warn("该班级已选该课程，请勿重复添加");
        }
        courseGrade.setCreateBy(getUsername());
        courseGrade.setCreateTime(DateUtils.getNowDate());
        return toAjax(courseGradeService.save(courseGrade));
    }

    /**
     * 修改班级课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级课程管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseGrade courseGrade)
    {
        courseGrade.setUpdateBy(getUsername());
        courseGrade.setUpdateTime(DateUtils.getNowDate());
        return toAjax(courseGradeService.updateById(courseGrade));
    }

    /**
     * 删除班级课程管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级课程管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        ArrayList<Long> idList = CollUtil.toList(ids);
        return toAjax(courseGradeService.removeByIds(idList));
    }
}

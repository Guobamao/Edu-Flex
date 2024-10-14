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
import com.eduflex.manage.domain.CourseChapter;
import com.eduflex.manage.service.ICourseChapterService;
import com.eduflex.common.utils.poi.ExcelUtil;

/**
 * 课程内容章节管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
@RestController
@RequestMapping("/manage/chapter")
public class CourseChapterController extends BaseController
{
    @Autowired
    private ICourseChapterService courseChapterService;

    /**
     * 查询课程内容章节管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:list')")
    @GetMapping("/list")
    public AjaxResult list(CourseChapter courseChapter)
    {
        List<CourseChapter> list = courseChapterService.selectCourseChapterList(courseChapter);
        return success(list);
    }

    /**
     * 导出课程内容章节管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:export')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseChapter courseChapter)
    {
        List<CourseChapter> list = courseChapterService.selectCourseChapterList(courseChapter);
        ExcelUtil<CourseChapter> util = new ExcelUtil<CourseChapter>(CourseChapter.class);
        util.exportExcel(response, list, "课程内容章节管理数据");
    }

    /**
     * 获取课程内容章节管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseChapterService.selectCourseChapterById(id));
    }

    /**
     * 新增课程内容章节管理
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:add')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseChapter courseChapter)
    {
        return toAjax(courseChapterService.insertCourseChapter(courseChapter));
    }

    /**
     * 修改课程内容章节管理
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:edit')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseChapter courseChapter)
    {
        return toAjax(courseChapterService.updateCourseChapter(courseChapter));
    }

    /**
     * 删除课程内容章节管理
     */
    @PreAuthorize("@ss.hasPermi('manage:chapter:remove')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(courseChapterService.deleteCourseChapterByIds(ids));
    }
}

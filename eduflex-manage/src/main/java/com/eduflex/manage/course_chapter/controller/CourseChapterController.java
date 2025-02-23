package com.eduflex.manage.course_chapter.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public AjaxResult list(CourseChapter courseChapter)
    {
        List<CourseChapterVo> list = courseChapterService.selectCourseChapterList(courseChapter);
        return success(list);
    }

    /**
     * 导出课程内容章节管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CourseChapter courseChapter)
    {
        List<CourseChapterVo> list = courseChapterService.selectCourseChapterList(courseChapter);
        ExcelUtil<CourseChapterVo> util = new ExcelUtil<>(CourseChapterVo.class);
        util.exportExcel(response, list, "课程内容章节管理数据");
    }

    /**
     * 获取课程内容章节管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseChapterService.getById(id));
    }

    /**
     * 新增课程内容章节管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseChapter courseChapter)
    {
        courseChapter.setCreateBy(getUsername());
        return toAjax(courseChapterService.saveChapter(courseChapter));
    }

    /**
     * 修改课程内容章节管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseChapter courseChapter)
    {
        courseChapter.setUpdateBy(getUsername());
        return toAjax(courseChapterService.updateById(courseChapter));
    }

    /**
     * 删除课程内容章节管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "课程内容章节管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(courseChapterService.deleteCourseChapterByIds(idList));
    }
}

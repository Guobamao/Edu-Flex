package com.eduflex.manage.category.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.category.domain.Category;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
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
import com.eduflex.manage.category.service.ICategoryService;
import com.eduflex.common.utils.poi.ExcelUtil;

/**
 * 课程分类Controller
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
@RestController
@RequestMapping("/manage/category")
public class CategoryController extends BaseController
{
    @Autowired
    private ICategoryService courseCategoryService;

    /**
     * 查询课程分类列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(Category category)
    {
        startPage();
        List<Category> list = courseCategoryService.selectCourseCategoryList(category);
        return getDataTable(list);
    }

    /**
     * 查询课程分类列表（排除节点）
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list/exclude/{id}")
    public AjaxResult excludeChild(@PathVariable(value = "id", required = false) Long id) {
        List<Category> courseCategories = courseCategoryService.selectCourseCategoryList(new Category());
        courseCategories.removeIf(c -> c.getId().longValue() == id || ArrayUtils.contains(StringUtils.split(c.getAncestors(), ","), id + ""));
        return success(courseCategories);
    }

    /**
     * 导出课程分类列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Category category)
    {
        List<Category> list = courseCategoryService.selectCourseCategoryList(category);
        ExcelUtil<Category> util = new ExcelUtil<>(Category.class);
        util.exportExcel(response, list, "课程分类数据");
    }

    /**
     * 获取课程分类详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseCategoryService.getById(id));
    }

    /**
     * 新增课程分类
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Category category)
    {
        category.setCreateBy(getUsername());
        category.setCreateTime(DateUtils.getNowDate());
        return toAjax(courseCategoryService.insertCategory(category));
    }

    /**
     * 修改课程分类
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Category category)
    {
        category.setUpdateBy(getUsername());
        category.setUpdateTime(DateUtils.getNowDate());
        return toAjax(courseCategoryService.updateById(category));
    }

    /**
     * 删除课程分类
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{categoryId}")
    public AjaxResult remove(@PathVariable Long categoryId)
    {
        // 查询是否有子分类
        if (courseCategoryService.hasChildByCategoryId(categoryId)) {
            return warn("存在子分类，不允许删除");
        }
        return toAjax(courseCategoryService.removeById(categoryId));
    }
}

package com.eduflex.manage.category.controller;

import java.util.List;

import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.domain.vo.CategoryVo;
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
        List<CategoryVo> list = courseCategoryService.selectCourseCategoryList(category);
        return getDataTable(list);
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
        return toAjax(courseCategoryService.save(category));
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
        return toAjax(courseCategoryService.removeById(categoryId));
    }
}

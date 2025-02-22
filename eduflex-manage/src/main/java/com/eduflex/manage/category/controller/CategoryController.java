package com.eduflex.manage.category.controller;

import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.manage.category.domain.Category;
import com.eduflex.manage.category.domain.vo.CategoryVo;
import com.eduflex.manage.category.service.ICategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Category category)
    {
        startPage();
        PageInfo<Category> pageInfo = new PageInfo<>(courseCategoryService.selectCategoryList(category));
        List<CategoryVo> list = courseCategoryService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
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

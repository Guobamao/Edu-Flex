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
import com.eduflex.manage.domain.Homework;
import com.eduflex.manage.service.IHomeworkService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 作业管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-11-23
 */
@RestController
@RequestMapping("/manage/homework")
public class HomeworkController extends BaseController
{
    @Autowired
    private IHomeworkService homeworkService;

    /**
     * 查询作业管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:list')")
    @GetMapping("/list")
    public TableDataInfo list(Homework homework)
    {
        startPage();
        List<Homework> list = homeworkService.selectHomeworkList(homework);
        return getDataTable(list);
    }

    /**
     * 导出作业管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:export')")
    @Log(title = "作业管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Homework homework)
    {
        List<Homework> list = homeworkService.selectHomeworkList(homework);
        ExcelUtil<Homework> util = new ExcelUtil<Homework>(Homework.class);
        util.exportExcel(response, list, "作业管理数据");
    }

    /**
     * 获取作业管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(homeworkService.selectHomeworkById(id));
    }

    /**
     * 新增作业管理
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:add')")
    @Log(title = "作业管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Homework homework)
    {
        return toAjax(homeworkService.insertHomework(homework));
    }

    /**
     * 修改作业管理
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:edit')")
    @Log(title = "作业管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Homework homework)
    {
        return toAjax(homeworkService.updateHomework(homework));
    }

    /**
     * 删除作业管理
     */
    @PreAuthorize("@ss.hasPermi('manage:homework:remove')")
    @Log(title = "作业管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(homeworkService.deleteHomeworkByIds(ids));
    }
}

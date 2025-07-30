package com.eduflex.manage.homework.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.domain.vo.HomeworkVo;
import com.eduflex.manage.homework.service.IHomeworkService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 作业管理Controller
 *
 * @author 林煜鋒
 * @date 2024-11-23
 */
@RestController
@RequestMapping("/manage/homework")
public class HomeworkController extends BaseController {

    @Autowired
    private IHomeworkService homeworkService;

    /**
     * 查询作业管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Homework homework) {
        startPage();
        PageInfo<Homework> pageInfo = new PageInfo<>(homeworkService.selectHomeworkList(homework));
        List<HomeworkVo> list = homeworkService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出作业管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "作业管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Homework homework) {
        List<HomeworkVo> list = homeworkService.buildVo(homeworkService.selectHomeworkList(homework));
        ExcelUtil<HomeworkVo> util = new ExcelUtil<HomeworkVo>(HomeworkVo.class);
        util.exportExcel(response, list, "作业管理数据");
    }

    /**
     * 获取作业管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(homeworkService.getById(id));
    }

    /**
     * 新增作业管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "作业管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Homework homework) {
        homework.setCreateBy(getUsername());
        return toAjax(homeworkService.save(homework));
    }

    /**
     * 修改作业管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "作业管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Homework homework) {
        homework.setUpdateBy(getUsername());
        return toAjax(homeworkService.updateById(homework));
    }

    /**
     * 删除作业管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "作业管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable("ids") Long[] ids) {
        ArrayList<Long> idList = CollUtil.toList(ids);
        return toAjax(homeworkService.removeByIds(idList));
    }
}

package com.eduflex.manage.controller;

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
import com.eduflex.manage.domain.Goal;
import com.eduflex.manage.service.IGoalService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学习目标管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/manage/goal")
public class LearningGoalController extends BaseController
{
    @Autowired
    private IGoalService learningGoalService;

    /**
     * 查询学习目标管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Goal goal)
    {
        startPage();
        List<Goal> list = learningGoalService.selectLearningGoalList(goal);
        return getDataTable(list);
    }

    /**
     * 导出学习目标管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goal goal)
    {
        List<Goal> list = learningGoalService.selectLearningGoalList(goal);
        ExcelUtil<Goal> util = new ExcelUtil<>(Goal.class);
        util.exportExcel(response, list, "学习目标管理数据");
    }

    /**
     * 获取学习目标管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(learningGoalService.getById(id));
    }

    /**
     * 新增学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Goal goal)
    {
        goal.setCreateBy(getUsername());
        goal.setCreateTime(DateUtils.getNowDate());
        return toAjax(learningGoalService.save(goal));
    }

    /**
     * 修改学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Goal goal)
    {
        goal.setUpdateBy(getUsername());
        goal.setUpdateTime(DateUtils.getNowDate());
        return toAjax(learningGoalService.updateById(goal));
    }

    /**
     * 删除学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(learningGoalService.removeByIds(idList));
    }
}

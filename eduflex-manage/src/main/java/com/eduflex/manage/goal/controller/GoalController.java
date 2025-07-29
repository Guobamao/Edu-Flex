package com.eduflex.manage.goal.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.goal.domain.Goal;
import com.eduflex.manage.goal.domain.vo.GoalVo;
import com.eduflex.manage.goal.service.IGoalService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学习目标管理 Controller
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/manage/goal")
public class GoalController extends BaseController {

    @Autowired
    private IGoalService goalService;

    /**
     * 查询学习目标管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Goal goal) {
        startPage();
        PageInfo<Goal> pageInfo = new PageInfo<>(goalService.selectGoalList(goal));
        List<GoalVo> list = goalService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出学习目标管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goal goal) {
        List<GoalVo> list = goalService.buildVo(goalService.selectGoalList(goal));
        ExcelUtil<GoalVo> util = new ExcelUtil<>(GoalVo.class);
        util.exportExcel(response, list, "学习目标管理数据");
    }

    /**
     * 获取学习目标管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        List<Goal> goal = List.of(goalService.getById(id));
        return success(goalService.buildVo(goal).get(0));
    }

    /**
     * 新增学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Goal goal) {
        goal.setCreateBy(getUsername());
        return toAjax(goalService.save(goal));
    }

    /**
     * 修改学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Goal goal) {
        goal.setUpdateBy(getUsername());
        return toAjax(goalService.updateById(goal));
    }

    /**
     * 删除学习目标管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习目标管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(goalService.removeByIds(idList));
    }
}

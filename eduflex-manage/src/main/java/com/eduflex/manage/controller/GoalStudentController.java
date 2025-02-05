package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.dto.GoalStudentDto;
import com.eduflex.manage.domain.vo.GoalStudentVo;
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
import com.eduflex.manage.domain.GoalStudent;
import com.eduflex.manage.service.IGoalStudentService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学习目标-学生关联Controller
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */
@RestController
@RequestMapping("/manage/goalStudent")
public class GoalStudentController extends BaseController
{
    @Autowired
    private IGoalStudentService goalStudentService;

    /**
     * 查询学习目标-学生关联列表
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:list')")
    @GetMapping("/list")
    public TableDataInfo list(GoalStudentDto goalStudent)
    {
        startPage();
        List<GoalStudentVo> list = goalStudentService.selectGoalStudentList(goalStudent);
        return getDataTable(list);
    }

    /**
     * 导出学习目标-学生关联列表
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:export')")
    @Log(title = "学习目标-学生关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GoalStudentDto goalStudent)
    {
        List<GoalStudentVo> list = goalStudentService.selectGoalStudentList(goalStudent);
        ExcelUtil<GoalStudentVo> util = new ExcelUtil<>(GoalStudentVo.class);
        util.exportExcel(response, list, "学习目标-学生关联数据");
    }

    /**
     * 获取学习目标-学生关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(goalStudentService.getGoalStudentVoById(id));
    }

    /**
     * 新增学习目标-学生关联
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:add')")
    @Log(title = "学习目标-学生关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GoalStudent goalStudent)
    {
        // 检验数据是否重复
        if (goalStudentService.checkGoalStudentExist(goalStudent)) {
            return error("关联失败，该学生已关联到该学习目标");
        }
        goalStudent.setCreateBy(getUsername());
        goalStudent.setUpdateTime(DateUtils.getNowDate());
        return toAjax(goalStudentService.save(goalStudent));
    }

    /**
     * 修改学习目标-学生关联
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:edit')")
    @Log(title = "学习目标-学生关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GoalStudent goalStudent)
    {
        goalStudent.setUpdateBy(getUsername());
        goalStudent.setUpdateTime(DateUtils.getNowDate());
        return toAjax(goalStudentService.updateById(goalStudent));
    }

    /**
     * 删除学习目标-学生关联
     */
    @PreAuthorize("@ss.hasPermi('manage:goalStudent:remove')")
    @Log(title = "学习目标-学生关联", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(goalStudentService.removeByIds(idList));
    }
}

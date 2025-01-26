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
import com.eduflex.manage.domain.LearningRouteRecord;
import com.eduflex.manage.service.ILearningRouteRecordService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学习路线记录管理Controller
 * 
 * @author 林煜鋒
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/manage/routeRecord")
public class LearningRouteRecordController extends BaseController
{
    @Autowired
    private ILearningRouteRecordService learningRouteRecordService;

    /**
     * 查询学习路线记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(LearningRouteRecord learningRouteRecord)
    {
        startPage();
        List<LearningRouteRecord> list = learningRouteRecordService.selectLearningRouteRecordList(learningRouteRecord);
        return getDataTable(list);
    }

    /**
     * 导出学习路线记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:export')")
    @Log(title = "学习路线记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LearningRouteRecord learningRouteRecord)
    {
        List<LearningRouteRecord> list = learningRouteRecordService.selectLearningRouteRecordList(learningRouteRecord);
        ExcelUtil<LearningRouteRecord> util = new ExcelUtil<LearningRouteRecord>(LearningRouteRecord.class);
        util.exportExcel(response, list, "学习路线记录管理数据");
    }

    /**
     * 获取学习路线记录管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(learningRouteRecordService.selectLearningRouteRecordById(id));
    }

    /**
     * 新增学习路线记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:add')")
    @Log(title = "学习路线记录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LearningRouteRecord learningRouteRecord)
    {
        return toAjax(learningRouteRecordService.insertLearningRouteRecord(learningRouteRecord));
    }

    /**
     * 修改学习路线记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:edit')")
    @Log(title = "学习路线记录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LearningRouteRecord learningRouteRecord)
    {
        return toAjax(learningRouteRecordService.updateLearningRouteRecord(learningRouteRecord));
    }

    /**
     * 删除学习路线记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:routeRecord:remove')")
    @Log(title = "学习路线记录管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(learningRouteRecordService.deleteLearningRouteRecordByIds(ids));
    }
}

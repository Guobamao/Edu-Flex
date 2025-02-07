package com.eduflex.manage.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.manage.domain.vo.StudyRecordVo;
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
import com.eduflex.manage.domain.StudyRecord;
import com.eduflex.manage.service.IStudyRecordService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学习记录管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/manage/record")
public class StudyRecordController extends BaseController
{
    @Autowired
    private IStudyRecordService studyRecordService;

    /**
     * 查询学习记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(StudyRecord studyRecord)
    {
        startPage();
        List<StudyRecordVo> list = studyRecordService.selectStudyRecordList(studyRecord);
        return getDataTable(list);
    }

    /**
     * 导出学习记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:record:export')")
    @Log(title = "学习记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudyRecord studyRecord)
    {
        List<StudyRecordVo> list = studyRecordService.selectStudyRecordList(studyRecord);
        ExcelUtil<StudyRecordVo> util = new ExcelUtil<>(StudyRecordVo.class);
        util.exportExcel(response, list, "学习记录管理数据");
    }

    /**
     * 获取学习记录管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(studyRecordService.selectById(id));
    }

    /**
     * 新增学习记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:record:add')")
    @Log(title = "学习记录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudyRecord studyRecord)
    {
        return toAjax(studyRecordService.save(studyRecord));
    }

    /**
     * 修改学习记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:record:edit')")
    @Log(title = "学习记录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudyRecord studyRecord)
    {
        return toAjax(studyRecordService.updateById(studyRecord));
    }

    /**
     * 删除学习记录管理
     */
    @PreAuthorize("@ss.hasPermi('manage:record:remove')")
    @Log(title = "学习记录管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(studyRecordService.removeByIds(idList));
    }
}

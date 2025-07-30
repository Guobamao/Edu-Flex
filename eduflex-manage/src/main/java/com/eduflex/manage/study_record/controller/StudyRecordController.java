package com.eduflex.manage.study_record.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.domain.vo.StudyRecordVo;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学习记录管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/manage/record")
public class StudyRecordController extends BaseController {

    @Autowired
    private IStudyRecordService studyRecordService;


    /**
     * 查询学习记录管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(StudyRecord studyRecord) {
        startPage();
        PageInfo<StudyRecord> pageInfo = new PageInfo<>(studyRecordService.selectStudyRecordList(studyRecord));
        List<StudyRecordVo> list = studyRecordService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出学习记录管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "学习记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudyRecord studyRecord) {
        List<StudyRecordVo> list = studyRecordService.buildVo(studyRecordService.selectStudyRecordList(studyRecord));
        ExcelUtil<StudyRecordVo> util = new ExcelUtil<>(StudyRecordVo.class);
        util.exportExcel(response, list, "学习记录管理数据");
    }

    /**
     * 获取学习记录管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(studyRecordService.selectById(id));
    }

    /**
     * 新增学习记录管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学习记录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudyRecord studyRecord) {
        return toAjax(studyRecordService.save(studyRecord));
    }

    /**
     * 修改学习记录管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学习记录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudyRecord studyRecord) {
        return toAjax(studyRecordService.updateById(studyRecord));
    }

    /**
     * 删除学习记录管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学习记录管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable("ids") Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(studyRecordService.removeByIds(idList));
    }
}

package com.eduflex.manage.exam.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.manage.exam.domain.PendingDto;
import com.eduflex.manage.exam.domain.vo.ExamRecordVo;
import com.eduflex.manage.exam.service.IExamRecordService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 考试记录Controller
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@RestController
@RequestMapping("/manage/exam/record")
public class ExamRecordController extends BaseController {

    @Autowired
    private IExamRecordService examRecordService;

    /**
     * 查询考试记录列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(ExamRecord examRecord) {
        startPage();
        PageInfo<ExamRecord> pageInfo = new PageInfo<>(examRecordService.selectExamRecordList(examRecord));
        List<ExamRecordVo> list = examRecordService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出考试记录列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "考试记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExamRecord examRecord) {
        List<ExamRecordVo> list = examRecordService.buildVo(examRecordService.selectExamRecordList(examRecord));
        ExcelUtil<ExamRecordVo> util = new ExcelUtil<>(ExamRecordVo.class);
        util.exportExcel(response, list, "考试记录数据");
    }

    /**
     * 获取考试记录详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(examRecordService.selectExamResultById(id));
    }

    /**
     * 新增考试记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExamRecord examRecord) {
        return toAjax(examRecordService.save(examRecord));
    }

    /**
     * 修改考试记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExamRecord examRecord) {
        return toAjax(examRecordService.updateById(examRecord));
    }

    /**
     * 删除考试记录
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "考试记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable("ids") Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examRecordService.removeByIds(idList));
    }

    /**
     * 批阅试卷
     *
     * @param pendingDto 批阅信息
     * @return 结果
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @PutMapping("/pending")
    public AjaxResult pending(@RequestBody PendingDto pendingDto) {
        return toAjax(examRecordService.pending(pendingDto));
    }

}

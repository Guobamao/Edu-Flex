package com.eduflex.web.controller.system;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.system.domain.SysNotice;
import com.eduflex.system.service.ISysNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 公告 信息操作处理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/notice")
public class SysNoticeController extends BaseController {

    @Autowired
    private ISysNoticeService noticeService;

    /**
     * 获取通知公告列表
     */
    @PreAuthorize("@ss.hasPermi('system:notice:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysNotice notice) {
        startPage();
        List<SysNotice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 根据通知公告编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:notice:query')")
    @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable("noticeId") Long noticeId) {
        return success(noticeService.getById(noticeId));
    }

    /**
     * 新增通知公告
     */
    @PreAuthorize("@ss.hasPermi('system:notice:add')")
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysNotice notice) {
        notice.setCreateBy(getUsername());
        return toAjax(noticeService.save(notice));
    }

    /**
     * 修改通知公告
     */
    @PreAuthorize("@ss.hasPermi('system:notice:edit')")
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysNotice notice) {
        notice.setUpdateBy(getUsername());
        return toAjax(noticeService.updateById(notice));
    }

    /**
     * 删除通知公告
     */
    @PreAuthorize("@ss.hasPermi('system:notice:remove')")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{noticeIds}")
    public AjaxResult remove(@PathVariable("noticeIds") Long[] noticeIds) {
        return toAjax(noticeService.removeBatchByIds(CollUtil.toList(noticeIds)));
    }
}

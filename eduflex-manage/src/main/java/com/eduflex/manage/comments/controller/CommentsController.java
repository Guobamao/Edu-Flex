package com.eduflex.manage.comments.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
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
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.service.ICommentsService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 评论管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/manage/comments")
public class CommentsController extends BaseController
{
    @Autowired
    private ICommentsService commentsService;

    /**
     * 查询评论管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:list')")
    @GetMapping("/list")
    public TableDataInfo list(Comments comments)
    {
        startPage();
        List<CommentsVo> list = commentsService.selectCommentsList(comments);
        return getDataTable(list);
    }

    /**
     * 导出评论管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:export')")
    @Log(title = "评论管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Comments comments)
    {
        List<CommentsVo> list = commentsService.selectCommentsList(comments);
        ExcelUtil<CommentsVo> util = new ExcelUtil<>(CommentsVo.class);
        util.exportExcel(response, list, "评论管理数据");
    }

    /**
     * 获取评论管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(commentsService.getById(id));
    }

    /**
     * 新增评论管理
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:add')")
    @Log(title = "评论管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Comments comments)
    {
        comments.setCreateBy(getUsername());
        comments.setCreateTime(DateUtils.getNowDate());
        return toAjax(commentsService.save(comments));
    }

    /**
     * 修改评论管理
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:edit')")
    @Log(title = "评论管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Comments comments)
    {
        comments.setUpdateBy(getUsername());
        comments.setUpdateTime(DateUtils.getNowDate());
        return toAjax(commentsService.updateById(comments));
    }

    /**
     * 删除评论管理
     */
    @PreAuthorize("@ss.hasPermi('manage:comments:remove')")
    @Log(title = "评论管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(commentsService.removeByIds(idList));
    }
}

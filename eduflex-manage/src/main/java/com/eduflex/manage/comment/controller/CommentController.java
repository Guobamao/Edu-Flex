package com.eduflex.manage.comment.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.comment.domain.Comment;
import com.eduflex.manage.comment.domain.vo.CommentVo;
import com.eduflex.manage.comment.service.ICommentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 评论管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/manage/comment")
public class CommentController extends BaseController {

    @Autowired
    private ICommentService commentService;

    /**
     * 查询评论管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Comment comment) {
        startPage();
        PageInfo<Comment> pageInfo = new PageInfo<>(commentService.selectCommentsList(comment));
        List<CommentVo> list = commentService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出评论管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "评论管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Comment comment) {
        List<CommentVo> list = commentService.buildVo(commentService.selectCommentsList(comment));
        ExcelUtil<CommentVo> util = new ExcelUtil<>(CommentVo.class);
        util.exportExcel(response, list, "评论管理数据");
    }

    /**
     * 获取评论管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(commentService.getById(id));
    }

    /**
     * 新增评论管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "评论管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Comment comment) {
        comment.setCreateBy(getUsername());
        comment.setCreateTime(DateUtils.getNowDate());
        return toAjax(commentService.save(comment));
    }

    /**
     * 修改评论管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "评论管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Comment comment) {
        comment.setUpdateBy(getUsername());
        comment.setUpdateTime(DateUtils.getNowDate());
        return toAjax(commentService.updateById(comment));
    }

    /**
     * 删除评论管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "评论管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(commentService.removeByIds(idList));
    }
}

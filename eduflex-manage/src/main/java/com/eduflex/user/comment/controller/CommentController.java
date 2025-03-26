package com.eduflex.user.comment.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.comment.domain.Comment;
import com.eduflex.manage.comment.service.ICommentService;
import com.eduflex.user.comment.domain.vo.UserCommentVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 评论 - 用户端 Controller
 *
 * @author 林煜鋒
 * @date 2025-02-16
 */
@RestController(value = "UserCommentController")
@RequestMapping("/user/comment")
public class CommentController extends BaseController {

    @Autowired
    private ICommentService commentService;

    /**
     * 获取与课程评论列表
     * @param comment 查询条件
     * @return 课程评论列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Comment comment) {
        startPage();
        PageInfo<Comment> pageInfo = new PageInfo<>(commentService.selectUserCommentsList(comment));
        List<UserCommentVo> list = commentService.buildUserVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 发表评论
     * @param comment 评论内容
     */
    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping
    public void add(@RequestBody Comment comment) {
        comment.setUserId(getUserId());
        comment.setCreateBy(getUsername());
        commentService.save(comment);
    }
}

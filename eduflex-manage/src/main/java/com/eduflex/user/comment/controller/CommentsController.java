package com.eduflex.user.comment.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.manage.comments.service.ICommentsService;
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
@RestController(value = "UserCommentsController")
@RequestMapping("/user/comment")
public class CommentsController extends BaseController {

    @Autowired
    private ICommentsService commentsService;

    @GetMapping("/list")
    public TableDataInfo list(Comments comments) {
        startPage();
        List<CommentsVo> list = commentsService.selectCommentsList(comments);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping
    public void add(@RequestBody Comments comments) {
        comments.setUserId(getUserId());
        comments.setCreateBy(getUsername());
        commentsService.save(comments);
    }
}

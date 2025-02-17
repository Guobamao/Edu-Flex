package com.eduflex.user.comment.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.manage.comments.service.ICommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    private ICommentsService commentsService;

    @GetMapping("/list")
    public TableDataInfo list(Comments comments) {
        startPage();
        List<CommentsVo> list = commentsService.selectCommentsList(comments);
        return getDataTable(list);
    }
}

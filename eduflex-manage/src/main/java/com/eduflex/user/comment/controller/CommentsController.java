package com.eduflex.user.comment.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.manage.comments.service.ICommentsService;
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
@RestController(value = "UserCommentsController")
@RequestMapping("/user/comment")
public class CommentsController extends BaseController {

    @Autowired
    private ICommentsService commentsService;

    /**
     * 获取与课程评论列表
     * @param comments 查询条件
     * @return 课程评论列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Comments comments) {
        startPage();
        PageInfo<Comments> pageInfo = new PageInfo<>(commentsService.selectCommentsList(comments));
        List<CommentsVo> list = commentsService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 发表评论
     * @param comments 评论内容
     */
    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping
    public void add(@RequestBody Comments comments) {
        comments.setUserId(getUserId());
        comments.setCreateBy(getUsername());
        commentsService.save(comments);
    }
}

package com.eduflex.manage.comment.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.comment.domain.Comment;
import com.eduflex.manage.comment.domain.vo.CommentVo;
import com.eduflex.user.comment.domain.vo.UserCommentVo;

import java.util.List;

/**
 * 评论管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
public interface ICommentService extends IService<Comment> {
    /**
     * 查询评论管理列表
     *
     * @param comment 评论管理
     * @return 评论管理集合
     */
    List<Comment> selectCommentsList(Comment comment);

    /**
     * 构建评论集合Vo对象
     * @param commentList 评论集合
     * @return 评论集合Vo对象
     */
    List<CommentVo> buildVo(List<Comment> commentList);

    /**
     * 查询用户端评论列表
     * @param comment 查询条件
     * @return 结果
     */
    List<Comment> selectUserCommentsList(Comment comment);

    /**
     * 构建用户端
     * @param list 评论集合
     * @return 评论集合Vo对象
     */
    List<UserCommentVo> buildUserVo(List<Comment> list);
}

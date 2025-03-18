package com.eduflex.manage.comments.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.user.comment.domain.vo.UserCommentVo;

import java.util.List;

/**
 * 评论管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
public interface ICommentsService extends IService<Comments> {
    /**
     * 查询评论管理列表
     *
     * @param comments 评论管理
     * @return 评论管理集合
     */
    List<Comments> selectCommentsList(Comments comments);

    /**
     * 构建评论集合Vo对象
     * @param commentsList 评论集合
     * @return 评论集合Vo对象
     */
    List<CommentsVo> buildVo(List<Comments> commentsList);

    /**
     * 查询用户端评论列表
     * @param comments 查询条件
     * @return 结果
     */
    List<Comments> selectUserCommentsList(Comments comments);

    /**
     * 构建用户端
     * @param list 评论集合
     * @return 评论集合Vo对象
     */
    List<UserCommentVo> buildUserVo(List<Comments> list);
}

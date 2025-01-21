package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.Comments;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.CommentsVo;

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
    List<CommentsVo> selectCommentsList(Comments comments);
}

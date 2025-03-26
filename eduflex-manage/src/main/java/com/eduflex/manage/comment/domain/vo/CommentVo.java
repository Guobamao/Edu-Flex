package com.eduflex.manage.comment.domain.vo;

import com.eduflex.manage.comment.domain.Comment;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 评论管理Vo对象
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */

@EqualsAndHashCode(callSuper = true)
@Data
public class CommentVo extends Comment {
    private String courseName;

    private String userName;

    private String nickName;

    private Long avatar;
}

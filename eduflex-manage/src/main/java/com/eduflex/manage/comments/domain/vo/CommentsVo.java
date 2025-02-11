package com.eduflex.manage.comments.domain.vo;

import com.eduflex.manage.comments.domain.Comments;
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
public class CommentsVo extends Comments {
    private String courseName;

    private String userName;

    private String nickName;
}

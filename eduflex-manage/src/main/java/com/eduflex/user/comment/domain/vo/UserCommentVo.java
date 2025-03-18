package com.eduflex.user.comment.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 用户端 - 评论视图
 *
 * @author 林煜鋒
 */
@Data
public class UserCommentVo {
    private Long id;
    private Long courseId;
    private Long userId;
    private String content;
    private String courseName;
    private String userName;
    private String nickName;
    private Long avatar;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}

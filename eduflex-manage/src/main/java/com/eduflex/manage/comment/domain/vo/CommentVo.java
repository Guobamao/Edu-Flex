package com.eduflex.manage.comment.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.comment.domain.Comment;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 评论管理Vo对象
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */

@EqualsAndHashCode(callSuper = true)
@Data
public class CommentVo extends Comment {

    @Excel(name = "课程名称", sort = 1)
    private String courseName;

    @Excel(name = "用户名称", sort = 2)
    private String userName;

    @Excel(name = "用户昵称", sort = 3)
    private String nickName;

    private Long avatar;

    @Excel(name = "发送时间", sort = 5, dateFormat = "yyyy-MM-dd HH:mm:ss", width = 20)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}

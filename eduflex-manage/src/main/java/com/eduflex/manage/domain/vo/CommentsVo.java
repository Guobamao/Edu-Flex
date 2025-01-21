package com.eduflex.manage.domain.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import com.eduflex.manage.domain.Comments;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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

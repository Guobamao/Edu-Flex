package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


/**
 * 学生管理对象 tb_student
 *
 * @author 林煜鋒
 * @date 2024-10-07
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_student")
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 关联sys_user表的ID */
    private Long userId;
}

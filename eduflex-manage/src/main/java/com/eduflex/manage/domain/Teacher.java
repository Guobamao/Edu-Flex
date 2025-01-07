package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.core.domain.entity.SysUser;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 教师管理对象 tb_teacher
 *
 * @author 林煜鋒
 * @date 2024-10-05
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_teacher")
public class Teacher extends SysUser
{
    private static final long serialVersionUID = 1L;

    /** 教师ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 关联sys_user表的id */
    private Long userId;

    /** 所属学院ID */
    @Excel(name = "所属学院ID")
    private Long collegeId;
}

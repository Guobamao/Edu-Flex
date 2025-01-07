package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excels;
import com.eduflex.common.core.domain.entity.SysDept;
import com.eduflex.common.core.domain.entity.SysRole;
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

import java.util.Date;
import java.util.List;

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
public class Student extends SysUser
{
    private static final long serialVersionUID = 1L;

    /** 学生ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 关联sys_user表的ID */
    private Long userId;

    /** 所属学院ID */
    @Excel(name = "所属学院ID")
    private Long collegeId;

    /** 所属班级ID */
    @Excel(name = "所属班级ID")
    private Long gradeId;

    /** 部门ID */
    @TableField(exist = false)
    private Long deptId;

    /** 用户账号 */
    private String userName;

    /** 用户昵称 */
    private String nickName;

    /** 用户邮箱 */
    @TableField(exist = false)
    private String email;

    /** 手机号码 */
    private String phonenumber;

    /** 用户性别 */
    @TableField(exist = false)
    private String sex;

    /** 用户头像 */
    @TableField(exist = false)
    private String avatar;

    /** 密码 */
    @TableField(exist = false)
    private String password;

    /** 帐号状态（0正常 1停用） */
    @TableField(exist = false)
    private String status;

    /** 最后登录IP */
    @TableField(exist = false)
    private String loginIp;

    /** 最后登录时间 */
    @TableField(exist = false)
    private Date loginDate;

    /** 部门对象 */
    @TableField(exist = false)
    private SysDept dept;

    /** 角色对象 */
    @TableField(exist = false)
    private List<SysRole> roles;

    /** 角色组 */
    @TableField(exist = false)
    private Long[] roleIds;

    /** 岗位组 */
    @TableField(exist = false)
    private Long[] postIds;

    /** 角色ID */
    @TableField(exist = false)
    private Long roleId;

    /** 删除标志（0代表存在 2代表删除） */
    @TableField(exist = false)
    private String delFlag;
}

package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 学院管理对象 tb_college
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_college")
public class College extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学院ID */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 父级学院ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long parentId;

    /** 祖级列表 */
    private String ancestors;

    /** 学院名称 */
    @Excel(name = "学院名称")
    private String name;

    /** 父级学院名称 */
    @TableField(exist = false)
    private String parentName;

    /** 子部门 */
    @TableField(exist = false)
    private List<College> children = new ArrayList<College>();
}

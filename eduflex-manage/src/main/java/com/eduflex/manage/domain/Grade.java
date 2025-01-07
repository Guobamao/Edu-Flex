package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
 * 班级管理对象 tb_grade
 *
 * @author 林煜鋒
 * @date 2024-10-05
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_grade")
public class Grade extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 班级ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 所属学院ID */
    @Excel(name = "所属学院ID")
    private Long collegeId;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String name;
}

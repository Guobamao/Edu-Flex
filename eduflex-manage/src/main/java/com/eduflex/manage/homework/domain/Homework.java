package com.eduflex.manage.homework.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 作业管理对象 tb_homework
 *
 * @author 林煜鋒
 * @date 2024-11-23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_homework")
public class Homework extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 作业ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 所属课程ID */
    @Excel(name = "所属课程ID")
    private Long courseId;

    /** 作业标题 */
    @Excel(name = "作业标题")
    private String title;

    /** 作业内容 */
    @Excel(name = "作业内容")
    private String content;
}

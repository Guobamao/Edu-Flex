package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.TreeEntity;

/**
 * 知识点分类对象 tb_knowledge
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_knowledge")
public class Knowledge extends TreeEntity<Knowledge> {
    private static final long serialVersionUID = 1L;

    /**
     * 知识点ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 关联课程ID
     */
    @Excel(name = "关联课程ID")
    private Long courseId;

    /**
     * 知识点名称
     */
    @Excel(name = "知识点名称")
    private String name;

    /**
     * 知识点描述
     */
    @Excel(name = "知识点描述")
    private String description;
}

package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 学习目标管理对象 tb_learning_goal
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_goal")
public class Goal extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 学习目标ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 名称
     */
    @Excel(name = "名称")
    private String goalName;

    /**
     * 目标描述
     */
    private String description;

    /**
     * 目标完成期限
     */
    private Integer deadline;
}

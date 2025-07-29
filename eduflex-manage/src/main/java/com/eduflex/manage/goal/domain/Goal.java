package com.eduflex.manage.goal.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

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
     * 关联用户ID
     */
    private Long userId;

    /**
     * 名称
     */
    @Excel(name = "名称", sort = 3)
    private String goalName;

    /**
     * 目标描述
     */
    @Excel(name = "目标描述", sort = 4)
    private String description;

    /**
     * 目标完成期限
     */
    @Excel(name = "目标完成期限", sort = 5, width = 20, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deadline;

    /**
     * 完成状态（0-未完成 1-已完成）
     */
    @Excel(name = "完成状态", sort = 6, dictType = "goal_status", comboReadDict = true)
    private Integer status;
}

package com.eduflex.manage.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 学习目标-学生关联对象 tb_goal_student
 *
 * @author 林煜鋒
 * @date 2025-01-26
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_goal_student")
public class GoalStudent extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 关联学生
     */
    @Excel(name = "关联学生")
    private Long userId;

    /**
     * 关联学习目标
     */
    @Excel(name = "关联学习目标")
    private Long goalId;

    /**
     * 学习目标状态
     */
    @Excel(name = "学习目标状态")
    private Long status;

    /**
     * 学习进度百分比
     */
    @Excel(name = "学习进度百分比")
    private BigDecimal progress;

    /**
     * 学习目标结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deadline;
}

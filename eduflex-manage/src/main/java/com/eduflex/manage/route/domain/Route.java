package com.eduflex.manage.route.domain;

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
 * 学习路线管理对象 tb_learning_route
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_route")
public class Route extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 学习路线ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 学习路线名称
     */
    private String name;

    /**
     * 学习目标
     */
    @Excel(name = "学习目标")
    private Long goalId;

    /**
     * 课程ID
     */
    @Excel(name = "课程ID")
    private String coursesId;
}

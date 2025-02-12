package com.eduflex.manage.direction.domain;

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
 * 课程方向对象 tb_direction
 *
 * @author 林煜鋒
 * @date 2025-02-12
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_direction")
public class Direction extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 名称
     */
    @Excel(name = "名称")
    private String name;

    /**
     * 启用状态(0-禁用 1-启用)
     */
    @Excel(name = "启用状态(0-禁用 1-启用)")
    private Integer status;
}

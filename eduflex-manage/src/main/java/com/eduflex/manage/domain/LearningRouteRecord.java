package com.eduflex.manage.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
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
 * 学习路线记录管理对象 tb_learning_route_record
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_learning_route_record")
public class LearningRouteRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 记录ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 学习者ID
     */
    @Excel(name = "学习者ID")
    private Long stuId;

    /**
     * 学习目标ID
     */
    @Excel(name = "学习目标ID")
    private Long goalId;

    /**
     * 学习路线ID
     */
    @Excel(name = "学习路线ID")
    private Long routeId;

    /**
     * 课程ID
     */
    @Excel(name = "课程ID")
    private Long courseId;

    /**
     * 完成时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date completionTime;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Long status;

    /**
     * 课程进度(%)
     */
    @Excel(name = "课程进度(%)")
    private BigDecimal progress;
}

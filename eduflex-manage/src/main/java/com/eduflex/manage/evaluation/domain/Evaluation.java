package com.eduflex.manage.evaluation.domain;

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
 * 课程评价管理对象 tb_evaluation
 *
 * @author 林煜鋒
 * @date 2025-02-25
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_evaluation")
public class Evaluation extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 评分
     */
    @Excel(name = "评分", sort = 4)
    private Integer score;

    /**
     * 评论
     */
    @Excel(name = "评论", sort = 5, width = 50)
    private String content;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 课程ID
     */
    private Long courseId;
}

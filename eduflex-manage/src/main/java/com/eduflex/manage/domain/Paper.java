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
 * 试卷管理对象 tb_paper
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_paper")
public class Paper extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 试卷ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 试卷名称
     */
    @Excel(name = "试卷名称")
    private String title;

    /**
     * 总分
     */
    @Excel(name = "总分")
    private Integer totalScore;

    @Excel(name = "关联课程")
    private Long courseId;
}

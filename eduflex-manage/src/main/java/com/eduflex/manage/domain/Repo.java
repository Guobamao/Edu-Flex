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
 * 题库管理对象 tb_repo
 *
 * @author 林煜鋒
 * @date 2025-02-09
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_repo")
public class Repo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 题库ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 题库名称
     */
    @Excel(name = "题库名称")
    private String name;

    /**
     * 关联课程
     */
    @Excel(name = "关联课程")
    private Long courseId;
}

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
 * 学习记录管理对象 tb_study_record
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_study_record")
public class StudyRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 学习记录ID
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 学习者
     */
    @Excel(name = "学习者")
    private Long studentId;

    /**
     * 课程
     */
    @Excel(name = "课程")
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
     * 课程进度百分比（0-100）
     */
    @Excel(name = "课程进度百分比", readConverterExp = "0=-100")
    private BigDecimal progress;
}

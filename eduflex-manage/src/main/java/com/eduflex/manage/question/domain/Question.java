package com.eduflex.manage.question.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

/**
 * 题目管理对象 tb_exam_question
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_question")
public class  Question extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 题目ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 题目内容
     */
    @Excel(name = "题目内容", align = HorizontalAlignment.LEFT, width = 30, sort = 2)
    private String title;

    /**
     * 题目类型（1-单选 2-多选 3-判断 4-填空 5-简答）
     */
    @Excel(name = "题目类型", readConverterExp = "1=单选,2=多选,3=判断,4=填空,5=简答", sort = 3)
    private Integer type;

    /**
     * 选项（JSON格式，仅适用于选择题）
     */
    private String options;

    /**
     * 正确答案
     */
    @Excel(name = "正确答案", sort = 8)
    private String answer;

    /**
     * 答案解析
     */
    @Excel(name = "答案解析", align = HorizontalAlignment.LEFT, width = 30, sort = 9)
    private String analysis;

    /**
     * 困难程度
     */
    @Excel(name = "困难程度", readConverterExp = "1=简单,2=普通,3=困难", sort = 10)
    private Integer difficulty;

    /**
     * 关联题库ID
     */
    private Long repoId;
}

package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 试卷题库关联表
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_paper_repo")
public class PaperRepo {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;
    private Long paperId;
    private Long repoId;
    private Integer singleChoiceCount;
    private Integer singleChoiceScore;
    private Integer multipleChoiceCount;
    private Integer multipleChoiceScore;
    private Integer judgeCount;
    private Integer judgeScore;
    private Integer blankCount;
    private Integer blankScore;
    private Integer shortAnswerCount;
    private Integer shortAnswerScore;
}

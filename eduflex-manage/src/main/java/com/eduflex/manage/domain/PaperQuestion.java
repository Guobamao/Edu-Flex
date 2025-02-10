package com.eduflex.manage.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_paper_question")
public class PaperQuestion {
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    private Long paperId;

    private Long questionId;

    private Integer type;

    private Integer orderNum;
}

package com.eduflex.manage.exam.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_exam_answer")
public class ExamAnswer {
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long recordId;
    private Long questionId;
    private String answer;
}

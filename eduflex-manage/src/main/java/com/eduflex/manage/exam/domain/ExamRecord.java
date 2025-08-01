package com.eduflex.manage.exam.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_exam_record")
public class ExamRecord extends BaseEntity {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long examId;
    private Long paperId;
    private Long userId;
    private Integer score;
    // 考试记录状态（0-未开始 1-进行中 2-待批阅 3-已完成）
    private Integer status;
    private Integer passed;
    private Integer duration;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    private Long jobId;
}

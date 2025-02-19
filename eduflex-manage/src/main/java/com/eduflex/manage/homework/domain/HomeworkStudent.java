package com.eduflex.manage.homework.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 作业学生关联对象 tb_homework_student
 *
 * @author 林煜鋒
 * @date 2025-02-18
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_homework_student")
public class HomeworkStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生作业ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 作业ID */
    private Long homeworkId;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date submitTime;

    // 提交状态（0-未做 1-待批阅 2-已批阅）
    private Integer status;

    // 作答内容
    private String answer;
}

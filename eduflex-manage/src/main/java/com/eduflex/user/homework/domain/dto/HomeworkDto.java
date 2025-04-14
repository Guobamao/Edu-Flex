package com.eduflex.user.homework.domain.dto;

import lombok.Data;

/**
 * 用户端作业请求参数
 * @author 林煜鋒
 */
@Data
public class HomeworkDto {
    private Long userId;
    private Long courseId;
    private Long homeworkId;
    private String answer;
}

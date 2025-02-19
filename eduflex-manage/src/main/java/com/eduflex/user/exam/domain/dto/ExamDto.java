package com.eduflex.user.exam.domain.dto;

import lombok.Data;

@Data
public class ExamDto {
    private Long userId;
    private Long courseId;
    private Long examId;
}

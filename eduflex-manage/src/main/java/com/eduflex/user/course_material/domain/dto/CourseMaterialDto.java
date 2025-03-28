package com.eduflex.user.course_material.domain.dto;

import lombok.Data;

/**
 * 课程资料传输对象
 */
@Data
public class CourseMaterialDto {
    // 用户ID
    private Long userId;
    // 章节ID
    private Long chapterId;
    // 选课记录ID (用于管理端查看用户课程章节学习进度）
    private Long recordId;
}

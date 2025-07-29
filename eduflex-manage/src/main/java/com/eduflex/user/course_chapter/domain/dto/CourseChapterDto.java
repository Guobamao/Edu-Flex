package com.eduflex.user.course_chapter.domain.dto;

import lombok.Data;

/**
 * 课程章节数据传输对象
 *
 * @author 林煜鋒
 */
@Data
public class CourseChapterDto {

    // 用户ID
    private Long userId;
    // 课程ID
    private Long courseId;

    // 选课记录ID (用于管理端查看用户课程章节学习进度）
    private Long recordId;
}

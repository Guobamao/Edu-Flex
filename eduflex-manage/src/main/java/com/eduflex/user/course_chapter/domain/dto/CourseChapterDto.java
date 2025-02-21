package com.eduflex.user.course_chapter.domain.dto;

import lombok.Data;

/**
 * 课程章节数据传输对象
 */
@Data
public class CourseChapterDto {
    // 用户ID
    private Long userId;
    // 课程ID
    private Long courseId;
    // 父级章节ID
    private Long parentId;
}

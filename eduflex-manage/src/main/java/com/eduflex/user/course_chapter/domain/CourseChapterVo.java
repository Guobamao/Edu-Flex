package com.eduflex.user.course_chapter.domain;

import com.eduflex.manage.course_chapter.domain.CourseChapter;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 课程章节 视图
 */
@Data
public class CourseChapterVo extends CourseChapter {
    private Integer progress;
}

package com.eduflex.user.course_chapter.domain;

import lombok.Data;

/**
 * 用户端 - 课程章节Vo视图
 *
 * @author 林煜鋒
 */
@Data
public class CourseChapterVo {
    // 章节ID
    private Long id;
    // 章节名称
    private String chapterName;
    // 课程ID
    private Long courseId;
    // 课程名称
    private String courseName;
    // 章节排序
    private Integer sort;
    // 是否关联资料
    private Boolean hasChildren;
    // 学习进度
    private Integer progress;
}

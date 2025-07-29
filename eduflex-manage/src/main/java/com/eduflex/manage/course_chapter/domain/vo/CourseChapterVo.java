package com.eduflex.manage.course_chapter.domain.vo;

import lombok.Data;
import org.apache.ibatis.type.Alias;

/**
 * 管理端 - 课程章节视图Vo对象
 *
 * @author 林煜鋒
 */
@Data
@Alias("AdminCourseChapterVo")
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
}

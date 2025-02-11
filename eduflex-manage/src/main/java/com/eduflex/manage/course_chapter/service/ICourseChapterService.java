package com.eduflex.manage.course_chapter.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;

/**
 * 课程内容章节管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface ICourseChapterService extends IService<CourseChapter>
{
    /**
     * 查询课程内容章节管理列表
     *
     * @param courseChapter 课程内容章节管理
     * @return 课程内容章节管理集合
     */
    List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter);

    /**
     * 新增课程内容章节管理
     *
     * @param courseChapter 课程内容章节管理
     * @return 结果
     */
    int insertCourseChapter(CourseChapter courseChapter);

    /**
     * 批量删除课程内容章节管理
     *
     * @param ids 需要删除的课程内容章节管理主键集合
     * @return 结果
     */
    int deleteCourseChapterByIds(Long[] ids);
}

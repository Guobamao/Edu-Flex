package com.eduflex.manage.course_chapter.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;

import java.util.List;

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
    List<com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo> selectCourseChapterList(CourseChapter courseChapter);

    /**
     * 批量删除课程内容章节管理
     *
     * @param idList id集合
     * @return 结果
     */
    int deleteCourseChapterByIds(List<Long> idList);

    /**
     * 查询课程章节列表 - 带进度
     * @param courseChapter 查询条件
     * @return 课程章节列表
     */
    List<CourseChapterVo> selectCourseChapterListWithProgress(CourseChapterDto courseChapter);

    /**
     * 新增课程章节信息
     * @param courseChapter 课程章节信息
     * @return 结果
     */
    int saveChapter(CourseChapter courseChapter);
}

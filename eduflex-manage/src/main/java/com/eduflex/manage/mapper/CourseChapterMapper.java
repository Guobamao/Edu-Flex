package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.CourseChapter;

/**
 * 课程内容章节管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface CourseChapterMapper 
{
    /**
     * 查询课程内容章节管理
     * 
     * @param id 课程内容章节管理主键
     * @return 课程内容章节管理
     */
    public CourseChapter selectCourseChapterById(Long id);

    /**
     * 查询课程内容章节管理列表
     * 
     * @param courseChapter 课程内容章节管理
     * @return 课程内容章节管理集合
     */
    public List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter);

    /**
     * 新增课程内容章节管理
     * 
     * @param courseChapter 课程内容章节管理
     * @return 结果
     */
    public int insertCourseChapter(CourseChapter courseChapter);

    /**
     * 修改课程内容章节管理
     * 
     * @param courseChapter 课程内容章节管理
     * @return 结果
     */
    public int updateCourseChapter(CourseChapter courseChapter);

    /**
     * 删除课程内容章节管理
     * 
     * @param id 课程内容章节管理主键
     * @return 结果
     */
    public int deleteCourseChapterById(Long id);

    /**
     * 批量删除课程内容章节管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseChapterByIds(Long[] ids);

    public int selectMaxOrderNum(Long parentId);
}

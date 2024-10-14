package com.eduflex.manage.service.impl;

import java.util.List;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseChapterMapper;
import com.eduflex.manage.domain.CourseChapter;
import com.eduflex.manage.service.ICourseChapterService;

/**
 * 课程内容章节管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
@Service
public class CourseChapterServiceImpl implements ICourseChapterService 
{
    @Autowired
    private CourseChapterMapper courseChapterMapper;

    /**
     * 查询课程内容章节管理
     * 
     * @param id 课程内容章节管理主键
     * @return 课程内容章节管理
     */
    @Override
    public CourseChapter selectCourseChapterById(Long id)
    {
        return courseChapterMapper.selectCourseChapterById(id);
    }

    /**
     * 查询课程内容章节管理列表
     * 
     * @param courseChapter 课程内容章节管理
     * @return 课程内容章节管理
     */
    @Override
    public List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter)
    {
        return courseChapterMapper.selectCourseChapterList(courseChapter);
    }

    /**
     * 新增课程内容章节管理
     * 
     * @param courseChapter 课程内容章节管理
     * @return 结果
     */
    @Override
    public int insertCourseChapter(CourseChapter courseChapter)
    {
        // 判断新增的是章节还是小节
        if (StringUtils.isNull(courseChapter.getParentId())) { // 新增章节
            courseChapter.setParentId(0L);
        }
        // 判断排序字段是否存在
        if (StringUtils.isNull(courseChapter.getOrderNum())) {
            int maxOrderNum = courseChapterMapper.selectMaxOrderNum(courseChapter.getParentId());
            courseChapter.setOrderNum(maxOrderNum + 1);
        }
        courseChapter.setCreateTime(DateUtils.getNowDate());
        return courseChapterMapper.insertCourseChapter(courseChapter);
    }

    /**
     * 修改课程内容章节管理
     * 
     * @param courseChapter 课程内容章节管理
     * @return 结果
     */
    @Override
    public int updateCourseChapter(CourseChapter courseChapter)
    {
        courseChapter.setUpdateTime(DateUtils.getNowDate());
        return courseChapterMapper.updateCourseChapter(courseChapter);
    }

    /**
     * 批量删除课程内容章节管理
     * 
     * @param ids 需要删除的课程内容章节管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseChapterByIds(Long[] ids)
    {
        return courseChapterMapper.deleteCourseChapterByIds(ids);
    }

    /**
     * 删除课程内容章节管理信息
     * 
     * @param id 课程内容章节管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseChapterById(Long id)
    {
        return courseChapterMapper.deleteCourseChapterById(id);
    }
}

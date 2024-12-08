package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.manage.domain.CourseMaterial;
import com.eduflex.manage.mapper.CourseMaterialMapper;
import com.eduflex.manage.service.ICourseMaterialService;
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
public class CourseChapterServiceImpl extends ServiceImpl<CourseChapterMapper, CourseChapter> implements ICourseChapterService
{
    @Autowired
    private CourseChapterMapper courseChapterMapper;
    @Autowired
    private CourseMaterialMapper courseMaterialMapper;

    /**
     * 查询课程内容章节管理列表
     * 
     * @param courseChapter 课程内容章节管理
     * @return 课程内容章节管理
     */
    @Override
    public List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter)
    {
        LambdaQueryWrapper<CourseChapter> wrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getId() != null, CourseChapter::getId, courseChapter.getId())
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId())
                .like(courseChapter.getName() != null && !courseChapter.getName().isEmpty(), CourseChapter::getName, courseChapter.getName())
                .eq(courseChapter.getParentId() != null, CourseChapter::getParentId, courseChapter.getParentId())
                .eq(courseChapter.getHasChildren() != null, CourseChapter::getHasChildren, courseChapter.getHasChildren());
        return courseChapterMapper.selectList(wrapper);
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
        if (StringUtils.isNull(courseChapter.getParentId())) {
            courseChapter.setParentId(0L);
        }
        // 判断排序字段是否存在
        if (StringUtils.isNull(courseChapter.getOrderNum())) {
            int maxOrderNum = courseChapterMapper.selectMaxOrderNum(courseChapter.getParentId());
            courseChapter.setOrderNum(maxOrderNum + 1);
        }
        courseChapter.setCreateTime(DateUtils.getNowDate());
        return courseChapterMapper.insert(courseChapter);
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
        LambdaQueryWrapper<CourseChapter> chapterWrapper =  new LambdaQueryWrapper<CourseChapter>();
        LambdaQueryWrapper<CourseMaterial> materialWrapper =  new LambdaQueryWrapper<>();
        // 判断其是否关联资料
        for (Long id : ids) {

            chapterWrapper.eq(CourseChapter::getParentId, id);

            if (StringUtils.isNotEmpty(courseChapterMapper.selectList(chapterWrapper))) {
                throw new ServiceException("该章节下存在小节，无法删除！");
            }

            materialWrapper.eq(CourseMaterial::getChapterId, id);
            if (StringUtils.isNotEmpty(courseMaterialMapper.selectList(materialWrapper))) {
                throw new ServiceException("该章节下存在资料，无法删除！");
            }
        }

        ArrayList<Long> idList = CollUtil.toList(ids);
        return courseChapterMapper.deleteByIds(idList);
    }
}

package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.CourseChapter;
import com.eduflex.manage.mapper.CourseChapterMapper;
import com.eduflex.manage.service.ICourseChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseMaterialMapper;
import com.eduflex.manage.domain.CourseMaterial;
import com.eduflex.manage.service.ICourseMaterialService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 课程资料Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
@Service
public class CourseMaterialServiceImpl extends ServiceImpl<CourseMaterialMapper, CourseMaterial> implements ICourseMaterialService
{
    @Autowired
    private CourseMaterialMapper courseMaterialMapper;
    @Autowired
    private CourseChapterMapper courseChapterMapper;

    /**
     * 查询课程资料列表
     * 
     * @param courseMaterial 课程资料
     * @return 课程资料
     */
    @Override
    public List<CourseMaterial> selectCourseMaterialList(CourseMaterial courseMaterial)
    {
        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<CourseMaterial>()
                .eq(courseMaterial.getId() != null, CourseMaterial::getId, courseMaterial.getId())
                .eq(courseMaterial.getChapterId() != null, CourseMaterial::getChapterId, courseMaterial.getChapterId())
                .eq(courseMaterial.getMaterialType() != null, CourseMaterial::getMaterialType, courseMaterial.getMaterialType());
        return courseMaterialMapper.selectList(wrapper);
    }

    /**
     * 新增课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    @Transactional
    @Override
    public int insertCourseMaterial(CourseMaterial courseMaterial)
    {
        int result = courseMaterialMapper.insert(courseMaterial);
        if (result > 0) {
            LambdaUpdateWrapper<CourseChapter> updateWrapper = new LambdaUpdateWrapper<CourseChapter>()
                    .eq(CourseChapter::getId, courseMaterial.getChapterId())
                    .set(CourseChapter::getHasChildren, 1L);
            courseChapterMapper.update(null, updateWrapper);
        }
        return result;
    }


    /**
     * 批量删除课程资料
     * 
     * @param ids 需要删除的课程资料主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteCourseMaterialByIds(Long[] ids)
    {
        // 用HashSet存储根据ids查询的chapterId
        Set<Long> chapterIds = new HashSet<>();
        for (Long id : ids) {
            chapterIds.add(courseMaterialMapper.selectCourseMaterialById(id).getChapterId());
        }

        ArrayList<Long> idList = CollUtil.toList(ids);
        int result = courseMaterialMapper.deleteByIds(idList);

        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<>();
        for (Long chapterId : chapterIds) {
            CourseChapter courseChapter = new CourseChapter();
            courseChapter.setId(chapterId);

            wrapper.eq(CourseMaterial::getChapterId, chapterId);
            courseChapter.setHasChildren(courseMaterialMapper.selectList(wrapper).isEmpty() ? 0L : 1L);
            courseChapterMapper.updateById(courseChapter);
        }
        return result;
    }
}

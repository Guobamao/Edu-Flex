package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.CourseChapter;
import com.eduflex.manage.mapper.CourseChapterMapper;
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
        return baseMapper.selectList(wrapper);
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
            chapterIds.add(baseMapper.selectById(id).getChapterId());
        }

        ArrayList<Long> idList = CollUtil.toList(ids);
        int result = baseMapper.deleteByIds(idList);

        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<>();
        for (Long chapterId : chapterIds) {
            CourseChapter courseChapter = new CourseChapter();
            courseChapter.setId(chapterId);

            wrapper.eq(CourseMaterial::getChapterId, chapterId);
            courseChapter.setHasChildren(baseMapper.selectList(wrapper).isEmpty() ? Boolean.FALSE : Boolean.TRUE);
            courseChapterMapper.updateById(courseChapter);
        }
        return result;
    }

    @Override
    public int getByFileId(Long id) {
        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<CourseMaterial>()
                .eq(CourseMaterial::getFileId, id);
        return baseMapper.selectCount(wrapper).intValue();
    }

    @Override
    public void removeByFileId(Long id) {
        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<CourseMaterial>()
                .eq(CourseMaterial::getFileId, id);
        baseMapper.delete(wrapper);
    }
}

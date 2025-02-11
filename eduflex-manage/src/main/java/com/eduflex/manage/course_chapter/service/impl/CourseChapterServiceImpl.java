package com.eduflex.manage.course_chapter.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.mapper.CourseMaterialMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.course_chapter.mapper.CourseChapterMapper;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;

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
    private CourseMaterialMapper courseMaterialMapper;

    @Override
    public List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter)
    {
        LambdaQueryWrapper<CourseChapter> chapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getId() != null, CourseChapter::getId, courseChapter.getId())
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId())
                .like(courseChapter.getName() != null && !courseChapter.getName().isEmpty(), CourseChapter::getName, courseChapter.getName())
                .eq(courseChapter.getParentId() != null, CourseChapter::getParentId, courseChapter.getParentId());
        return buildTree(baseMapper.selectList(chapterWrapper));
    }

    @Override
    public int insertCourseChapter(CourseChapter courseChapter)
    {
        // 判断新增的是章节还是小节
        if (StringUtils.isNull(courseChapter.getParentId())) {
            courseChapter.setParentId(0L);
        }
        // 判断排序字段是否存在
        if (StringUtils.isNull(courseChapter.getOrderNum())) {
            int maxOrderNum = baseMapper.selectMaxOrderNum(courseChapter.getParentId());
            courseChapter.setOrderNum(maxOrderNum + 1);
        }
        courseChapter.setCreateTime(DateUtils.getNowDate());
        return baseMapper.insert(courseChapter);
    }

    @Override
    public int deleteCourseChapterByIds(Long[] ids)
    {
        LambdaQueryWrapper<CourseChapter> chapterWrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<CourseMaterial> materialWrapper =  new LambdaQueryWrapper<>();
        // 判断其是否关联资料
        for (Long id : ids) {

            chapterWrapper.eq(CourseChapter::getParentId, id);

            if (StringUtils.isNotEmpty(baseMapper.selectList(chapterWrapper))) {
                throw new ServiceException("该章节下存在小节，无法删除！");
            }

            materialWrapper.eq(CourseMaterial::getChapterId, id);
            if (StringUtils.isNotEmpty(courseMaterialMapper.selectList(materialWrapper))) {
                throw new ServiceException("该章节下存在资料，无法删除！");
            }
        }

        ArrayList<Long> idList = CollUtil.toList(ids);
        return baseMapper.deleteByIds(idList);
    }

    private List<CourseChapter> buildTree(List<CourseChapter> chapterList) {

        Map<Long, CourseChapter> idMap = chapterList.stream()
                .collect(Collectors.toMap(CourseChapter::getId, chapter -> chapter));

        List<CourseChapter> tree = new ArrayList<>();

        for (CourseChapter chapter : chapterList) {
            Long parentId = chapter.getParentId();
            if (parentId == 0) {
                // 根节点直接放入树中
                tree.add(chapter);
            } else {
                // 子节点加入父节点的 children 列表
                CourseChapter parent = idMap.get(parentId);
                if (parent != null) {
                    if (parent.getChildren() == null) {
                        parent.setChildren(new ArrayList<>());
                    }
                    parent.getChildren().add(chapter);
                    parent.setHasChildren(true);
                }
            }
        }

        for (CourseChapter chapter : chapterList) {
            LambdaQueryWrapper<CourseMaterial> materialWrapper = new LambdaQueryWrapper<CourseMaterial>()
                    .eq(chapter.getId() != null, CourseMaterial::getChapterId, chapter.getId());
            Long count = courseMaterialMapper.selectCount(materialWrapper);
            chapter.setHasChildren(count > 0);
        }
        return tree;
    }
}

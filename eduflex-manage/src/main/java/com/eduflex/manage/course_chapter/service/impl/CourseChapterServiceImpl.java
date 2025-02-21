package com.eduflex.manage.course_chapter.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;
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
public class CourseChapterServiceImpl extends ServiceImpl<CourseChapterMapper, CourseChapter> implements ICourseChapterService {
    @Autowired
    private ICourseMaterialService courseMaterialService;

    @Autowired
    private IStudyRecordService studyRecordService;

    @Override
    public List<CourseChapter> selectCourseChapterList(CourseChapter courseChapter) {
        LambdaQueryWrapper<CourseChapter> chapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getId() != null, CourseChapter::getId, courseChapter.getId())
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId())
                .like(courseChapter.getName() != null && !courseChapter.getName().isEmpty(), CourseChapter::getName, courseChapter.getName())
                .eq(courseChapter.getParentId() != null, CourseChapter::getParentId, courseChapter.getParentId());
        return buildTree(baseMapper.selectList(chapterWrapper));
    }

    @Override
    public int insertCourseChapter(CourseChapter courseChapter) {
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
    public int deleteCourseChapterByIds(Long[] ids) {
        LambdaQueryWrapper<CourseChapter> chapterWrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<CourseMaterial> materialWrapper = new LambdaQueryWrapper<>();
        // 判断其是否关联资料
        for (Long id : ids) {

            chapterWrapper.eq(CourseChapter::getParentId, id);

            if (StringUtils.isNotEmpty(baseMapper.selectList(chapterWrapper))) {
                throw new ServiceException("该章节下存在小节，无法删除！");
            }

            materialWrapper.eq(CourseMaterial::getChapterId, id);
            if (StringUtils.isNotEmpty(courseMaterialService.list(materialWrapper))) {
                throw new ServiceException("该章节下存在资料，无法删除！");
            }
        }

        ArrayList<Long> idList = CollUtil.toList(ids);
        return baseMapper.deleteByIds(idList);
    }

    @Override
    public List<CourseChapterVo> selectCourseChapterListWithProgress(CourseChapterDto courseChapter) {
        LambdaQueryWrapper<CourseChapter> wrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId())
                .eq(courseChapter.getParentId() != null, CourseChapter::getParentId, courseChapter.getParentId());
        List<CourseChapter> courseChapters = baseMapper.selectList(wrapper);

        List<CourseChapterVo> courseChapterVoList = new ArrayList<>();

        // 记录每个根节点的进度总和和子节点数量
        Map<Long, Integer> rootProgressMap = new HashMap<>();
        Map<Long, Integer> rootWeightMap = new HashMap<>();

        // 处理所有非根节点
        for (CourseChapter chapter : courseChapters) {
            if (chapter.getParentId() != 0) {
                LambdaQueryWrapper<CourseMaterial> courseMaterialWrapper = new LambdaQueryWrapper<CourseMaterial>()
                        .eq(CourseMaterial::getChapterId, chapter.getId());
                List<CourseMaterial> courseMaterialList = courseMaterialService.list(courseMaterialWrapper);

                int progress = 0;
                int weight = 0;
                if (!courseMaterialList.isEmpty()) {
                    for (CourseMaterial courseMaterial : courseMaterialList) {
                        LambdaQueryWrapper<StudyRecord> studyRecordWrapper = new LambdaQueryWrapper<StudyRecord>()
                                .eq(StudyRecord::getUserId, courseChapter.getUserId())
                                .eq(StudyRecord::getCourseId, courseChapter.getCourseId())
                                .eq(StudyRecord::getChapterId, courseMaterial.getChapterId())
                                .eq(StudyRecord::getMaterialId, courseMaterial.getId());
                        List<StudyRecord> studyRecordList = studyRecordService.list(studyRecordWrapper);
                        for (StudyRecord studyRecord : studyRecordList) {
                            if (courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
                                progress += studyRecord.getProgress() * 2;
                                weight += 2;
                            } else {
                                progress += studyRecord.getProgress();
                                weight += 1;
                            }
                        }
                    }
                }

                if (weight != 0) {
                    progress = progress / weight;
                }

                CourseChapterVo courseChapterVo = new CourseChapterVo();
                BeanUtils.copyProperties(chapter, courseChapterVo);
                courseChapterVo.setProgress(progress);
                courseChapterVoList.add(courseChapterVo);

                // 更新根节点的进度总和和子节点数量
                if (chapter.getParentId() != 0) {
                    rootProgressMap.put(chapter.getParentId(), rootProgressMap.getOrDefault(chapter.getParentId(), 0) + progress);
                    rootWeightMap.put(chapter.getParentId(), rootWeightMap.getOrDefault(chapter.getParentId(), 0) + 1);
                }
            }
        }

        // 对每个根节点，计算它的进度
        for (CourseChapter chapter : courseChapters) {
            if (chapter.getParentId() == 0) {
                Long rootId = chapter.getId();
                int rootProgress = rootProgressMap.getOrDefault(rootId, 0);
                int rootWeight = rootWeightMap.getOrDefault(rootId, 0);

                if (rootWeight != 0) {
                    rootProgress = rootProgress / rootWeight;
                }

                CourseChapterVo courseChapterVo = new CourseChapterVo();
                BeanUtils.copyProperties(chapter, courseChapterVo);
                courseChapterVo.setProgress(rootProgress);
                courseChapterVoList.add(courseChapterVo);
            }
        }

        // 最后构建树形结构
        return buildVoTree(courseChapterVoList);
    }

    private List<CourseChapterVo> buildVoTree(List<CourseChapterVo> courseChapterVoList) {
        Map<Long, CourseChapterVo> idMap = courseChapterVoList.stream()
                .collect(Collectors.toMap(CourseChapterVo::getId, chapter -> chapter));
        List<CourseChapterVo> tree = new ArrayList<>();
        for (CourseChapterVo chapter : courseChapterVoList) {
            Long parentId = chapter.getParentId();
            if (parentId == 0) {
                // 根节点直接放入树中
                tree.add(chapter);
            } else {
                // 子节点加入父节点的 children 列表
                CourseChapterVo parent = idMap.get(parentId);
                if (parent != null) {
                    if (parent.getChildren() == null) {
                        parent.setChildren(new ArrayList<>());
                    }
                    parent.getChildren().add(chapter);
                    parent.setHasChildren(true);
                }
            }
        }
        for (CourseChapterVo courseChapterVo : courseChapterVoList) {
            LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<CourseMaterial>()
                    .eq(courseChapterVo.getId() != null, CourseMaterial::getChapterId, courseChapterVo.getId());
            long count = courseMaterialService.count(wrapper);
            courseChapterVo.setHasChildren(count > 0);
        }
        return tree;
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
            Long count = courseMaterialService.count(materialWrapper);
            chapter.setHasChildren(count > 0);
        }
        return tree;
    }
}

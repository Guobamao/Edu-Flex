package com.eduflex.manage.course_chapter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.mapper.CourseChapterMapper;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    private ICourseService courseService;

    @Override
    public List<com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo> selectCourseChapterList(CourseChapter courseChapter) {
        LambdaQueryWrapper<CourseChapter> chapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getId() != null, CourseChapter::getId, courseChapter.getId())
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId())
                .like(courseChapter.getName() != null && !courseChapter.getName().isEmpty(), CourseChapter::getName, courseChapter.getName())
                .orderByAsc(CourseChapter::getSort);
        List<CourseChapter> courseChapters = baseMapper.selectList(chapterWrapper);
        List<com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo> courseChapterVoList = new ArrayList<>();
        for (CourseChapter chapter : courseChapters) {
            com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo courseChapterVo = new com.eduflex.manage.course_chapter.domain.vo.CourseChapterVo();
            courseChapterVo.setId(chapter.getId());
            courseChapterVo.setCourseId(chapter.getCourseId());
            courseChapterVo.setCourseName(courseService.getById(chapter.getCourseId()).getName());
            courseChapterVo.setChapterName(chapter.getName());
            courseChapterVo.setSort(chapter.getSort());

            CourseMaterial courseMaterial = new CourseMaterial();
            courseMaterial.setChapterId(chapter.getId());
            List<CourseMaterial> courseMaterialList = courseMaterialService.selectCourseMaterialList(courseMaterial);
            courseChapterVo.setHasChildren(!courseMaterialList.isEmpty());
            courseChapterVoList.add(courseChapterVo);
        }
        return courseChapterVoList;
    }

    @Override
    public int deleteCourseChapterByIds(List<Long> idList) {
        // 判断其是否关联资料
        for (Long id : idList) {
            LambdaQueryWrapper<CourseMaterial> materialWrapper = new LambdaQueryWrapper<CourseMaterial>()
                    .eq(CourseMaterial::getChapterId, id);
            List<CourseMaterial> courseMaterialList = courseMaterialService.list(materialWrapper);
            if (!courseMaterialList.isEmpty()) {
                throw new ServiceException("该章节下存在资料，无法删除！");
            }
        }
        return baseMapper.deleteByIds(idList);
    }

    @Override
    public List<CourseChapterVo> selectCourseChapterListWithProgress(CourseChapterDto courseChapter) {
        // 获取章节列表
        LambdaQueryWrapper<CourseChapter> courseChapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                .eq(courseChapter.getCourseId() != null, CourseChapter::getCourseId, courseChapter.getCourseId());

        List<CourseChapter> courseChapters = baseMapper.selectList(courseChapterWrapper);
        List<CourseChapterVo> courseChapterVoList = new ArrayList<>();

        for (CourseChapter chapter : courseChapters) {
            CourseChapterVo courseChapterVo = new CourseChapterVo();
            courseChapterVo.setId(chapter.getId());
            courseChapterVo.setCourseId(chapter.getCourseId());
            courseChapterVo.setCourseName(courseService.getById(chapter.getCourseId()).getName());
            courseChapterVo.setChapterName(chapter.getName());
            courseChapterVo.setSort(chapter.getSort());

            // 获取章节下关联的资料
            CourseMaterial material = new CourseMaterial();
            material.setChapterId(chapter.getId());
            List<CourseMaterial> courseMaterialList = courseMaterialService.selectCourseMaterialList(material);
            courseChapterVo.setHasChildren(!courseMaterialList.isEmpty());

            if (courseChapter.getUserId() == null) {
                courseChapterVo.setProgress(0);
                courseChapterVoList.add(courseChapterVo);
                continue;
            }

            int progress = 0;
            int weight = 0;
            if (!courseMaterialList.isEmpty()) {
                for (CourseMaterial courseMaterial : courseMaterialList) {
                    // 获取资料学习进度
                    LambdaQueryWrapper<StudyRecord> studyRecordWrapper = new LambdaQueryWrapper<StudyRecord>()
                            .eq(StudyRecord::getUserId, courseChapter.getUserId())
                            .eq(StudyRecord::getCourseId, courseChapter.getCourseId())
                            .eq(StudyRecord::getChapterId, courseMaterial.getChapterId())
                            .eq(StudyRecord::getMaterialId, courseMaterial.getId());
                    StudyRecord studyRecord = studyRecordService.getOne(studyRecordWrapper);
                    if (studyRecord == null) {
                        weight += 1;
                        continue;
                    }
                    if (courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
                        progress += studyRecord.getProgress() * 2;
                        weight += 2;
                    } else {
                        progress += studyRecord.getProgress();
                        weight += 1;
                    }
                }
            }

            if (weight != 0) {
                progress = progress / weight;
            }
            courseChapterVo.setProgress(progress);
            courseChapterVoList.add(courseChapterVo);
        }
        return courseChapterVoList;
    }

    @Override
    public int saveChapter(CourseChapter courseChapter) {
        if (courseChapter.getSort() == null) {
            LambdaQueryWrapper<CourseChapter> courseChapterWrapper = new LambdaQueryWrapper<CourseChapter>()
                    .eq(CourseChapter::getCourseId, courseChapter.getCourseId())
                    .orderByDesc(CourseChapter::getSort)
                    .last("limit 1");
            CourseChapter chapter = baseMapper.selectOne(courseChapterWrapper);
            if (chapter != null) {
                courseChapter.setSort(chapter.getSort() + 1);
            } else {
                courseChapter.setSort(1);
            }
        }
        return baseMapper.insert(courseChapter);
    }
}

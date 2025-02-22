package com.eduflex.manage.course_material.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.domain.CourseChapter;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.mapper.CourseMaterialMapper;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.eduflex.user.course_material.domain.dto.CourseMaterialDto;
import com.eduflex.user.course_material.domain.vo.CourseMaterialVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static com.eduflex.common.utils.SecurityUtils.getUserId;

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
    private ICourseChapterService courseChapterService;

    @Autowired
    private IStudyRecordService studyRecordService;

    @Autowired
    private ICourseService courseService;

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
            courseChapterService.updateById(courseChapter);
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

    @Override
    public CourseMaterialVo selectById(Long id) {
        CourseMaterial courseMaterial = baseMapper.selectById(id);
        CourseChapter courseChapter = courseChapterService.getById(courseMaterial.getChapterId());
        Course course = courseService.getById(courseChapter.getCourseId());

        CourseMaterialVo courseMaterialVo = new CourseMaterialVo();
        BeanUtils.copyProperties(courseMaterial, courseMaterialVo);
        courseMaterialVo.setChapterName(courseChapter.getName());
        courseMaterialVo.setCourseId(courseChapter.getCourseId());
        courseMaterialVo.setCourseName(course.getName());
        LambdaQueryWrapper<StudyRecord> wrapper = new LambdaQueryWrapper<StudyRecord>()
                .eq(StudyRecord::getUserId, getUserId())
                .eq(StudyRecord::getCourseId, courseChapter.getCourseId())
                .eq(StudyRecord::getChapterId, courseMaterial.getChapterId())
                .eq(StudyRecord::getMaterialId, courseMaterial.getId());
        StudyRecord studyRecord = studyRecordService.getOne(wrapper);
        if (studyRecord != null) {
            courseMaterialVo.setStatus(studyRecord.getStatus());
            courseMaterialVo.setLastPosition(studyRecord.getLastPosition());
            courseMaterialVo.setProgress(studyRecord.getProgress());
        }
        return courseMaterialVo;
    }

    @Override
    public List<CourseMaterialVo> selectCourseMaterialListWithProgress(CourseMaterialDto courseMaterialDto) {
        LambdaQueryWrapper<CourseMaterial> wrapper = new LambdaQueryWrapper<CourseMaterial>()
                .eq(courseMaterialDto.getChapterId() != null, CourseMaterial::getChapterId, courseMaterialDto.getChapterId());
        List<CourseMaterial> courseMaterialList = baseMapper.selectList(wrapper);

        List<CourseMaterialVo> courseMaterialVoList = new ArrayList<>();

        for (CourseMaterial courseMaterial : courseMaterialList) {
            CourseMaterialVo courseMaterialVo = new CourseMaterialVo();
            BeanUtils.copyProperties(courseMaterial, courseMaterialVo);
            LambdaQueryWrapper<StudyRecord> studyRecordWrapper = new LambdaQueryWrapper<StudyRecord>()
                    .eq(StudyRecord::getUserId, courseMaterialDto.getUserId())
                    .eq(StudyRecord::getChapterId, courseMaterial.getChapterId())
                    .eq(StudyRecord::getMaterialId, courseMaterial.getId());
            StudyRecord studyRecord = studyRecordService.getOne(studyRecordWrapper);
            if (studyRecord != null) {
                courseMaterialVo.setStatus(studyRecord.getStatus());
                courseMaterialVo.setProgress(studyRecord.getProgress());
            } else {
                courseMaterialVo.setStatus(EduFlexConstants.STATUS_UNSTARTED);
                courseMaterialVo.setProgress(0);
            }
            courseMaterialVoList.add(courseMaterialVo);
        }
        return courseMaterialVoList;
    }
}

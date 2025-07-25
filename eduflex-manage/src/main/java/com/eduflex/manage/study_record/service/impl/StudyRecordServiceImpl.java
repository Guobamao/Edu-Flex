package com.eduflex.manage.study_record.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.course_chapter.service.ICourseChapterService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.file.domain.FileImages;
import com.eduflex.manage.file.service.IFileImagesService;
import com.eduflex.manage.student.domain.StudentCourse;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.domain.vo.StudyRecordVo;
import com.eduflex.manage.study_record.mapper.StudyRecordMapper;
import com.eduflex.manage.study_record.service.IStudyRecordService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.course_chapter.domain.CourseChapterVo;
import com.eduflex.user.course_chapter.domain.dto.CourseChapterDto;
import com.eduflex.user.study_record.domain.dto.StudyRecordDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import static com.eduflex.common.utils.SecurityUtils.getUsername;

/**
 * 学习记录管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@Service
public class StudyRecordServiceImpl extends ServiceImpl<StudyRecordMapper, StudyRecord> implements IStudyRecordService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ICourseMaterialService courseMaterialService;

    @Autowired
    private IFileImagesService fileImagesService;

    @Autowired
    private IStudentCourseService studentCourseService;

    @Autowired
    private ICourseChapterService courseChapterService;

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理
     */
    @Override
    public List<StudyRecord> selectStudyRecordList(StudyRecord studyRecord) {
        LambdaQueryWrapper<StudyRecord> wrapper = new LambdaQueryWrapper<StudyRecord>()
                .eq(studyRecord.getUserId() != null, StudyRecord::getUserId, studyRecord.getUserId())
                .eq(studyRecord.getCourseId() != null, StudyRecord::getCourseId, studyRecord.getCourseId())
                .eq(studyRecord.getStatus() != null, StudyRecord::getStatus, studyRecord.getStatus());

        return baseMapper.selectList(wrapper);
    }

    @Override
    public StudyRecordVo selectById(Long id) {
        return buildVo(List.of(baseMapper.selectById(id))).get(0);
    }

    @Override
    public String saveStudyRecord(StudyRecordDto studyRecordDto) {
        LambdaQueryWrapper<StudyRecord> studyRecordWrapper = new LambdaQueryWrapper<StudyRecord>()
                .eq(StudyRecord::getUserId, studyRecordDto.getUserId())
                .eq(StudyRecord::getCourseId, studyRecordDto.getCourseId())
                .eq(StudyRecord::getChapterId, studyRecordDto.getChapterId())
                .eq(StudyRecord::getMaterialId, studyRecordDto.getMaterialId());

        LambdaQueryWrapper<CourseMaterial> materialWrapper = new LambdaQueryWrapper<CourseMaterial>()
                .eq(CourseMaterial::getId, studyRecordDto.getMaterialId())
                .eq(CourseMaterial::getChapterId, studyRecordDto.getChapterId());
        CourseMaterial courseMaterial = courseMaterialService.getOne(materialWrapper);
        if (courseMaterial == null) {
            return "课程资料不存在";
        }
        studyRecordDto.setMaterialType(courseMaterial.getMaterialType());
        if (courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_TEXT) ||
                courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PPT) ||
                courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PDF)) {
            List<FileImages> fileImages = fileImagesService.getByFileId(courseMaterial.getFileId());
            if (fileImages.isEmpty()) {
                return "课程资料不存在";
            }
            FileImages fileImage = fileImages.stream().max(Comparator.comparing(FileImages::getPageNumber)).orElse(null);
            Integer maxNumber = fileImage.getPageNumber();
            // 最大页码
            studyRecordDto.setMaxDuration(maxNumber);
        } else if (courseMaterial.getMaterialType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
            studyRecordDto.setMaxDuration(courseMaterial.getDuration());
        } else {
            studyRecordDto.setMaxDuration(1);
        }

        if (baseMapper.selectOne(studyRecordWrapper) == null) {
            // 不存在记录，新增
            StudyRecord studyRecord = new StudyRecord();
            studyRecord.setUserId(studyRecordDto.getUserId());
            studyRecord.setCourseId(studyRecordDto.getCourseId());
            studyRecord.setChapterId(studyRecordDto.getChapterId());
            studyRecord.setMaterialId(studyRecordDto.getMaterialId());
            // 进行中
            studyRecord.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
            studyRecord.setCreateBy(getUsername());
            // 计算学习进度
            if (studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_TEXT) ||
                    studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PPT) ||
                    studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PDF)) {
                studyRecord.setLastPosition(studyRecordDto.getPicIndex());
                int progress = (studyRecordDto.getPicIndex() + 1) * 100 / studyRecordDto.getMaxDuration();
                studyRecord.setProgress(progress);
                if (progress == 100) {
                    studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
                }
            } else if (studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
                studyRecord.setLastPosition(studyRecordDto.getLastPosition());
                int progress = studyRecordDto.getLastPosition() * 100 / studyRecordDto.getMaxDuration();
                studyRecord.setProgress(progress);
                if (progress == 100) {
                    studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
                }
            } else {
                studyRecord.setProgress(100);
                studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
            }
            // 学习时长
            studyRecord.setDuration(studyRecordDto.getDuration());
            baseMapper.insert(studyRecord);
            if (studyRecord.getProgress() == 100) {
                return "当前资料已学习完成";
            }
        } else {
            // 记录存在，更新记录
            StudyRecord studyRecord = baseMapper.selectOne(studyRecordWrapper);
            studyRecord.setUpdateBy(getUsername());
            if (studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_TEXT) ||
                    studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PPT) ||
                    studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_PDF)) {
                if (studyRecordDto.getPicIndex() > studyRecord.getLastPosition()) {
                    studyRecord.setLastPosition(studyRecordDto.getPicIndex());
                    int progress = (studyRecordDto.getPicIndex() + 1) * 100 / studyRecordDto.getMaxDuration();
                    if (progress > studyRecord.getProgress()) {
                        studyRecord.setProgress(progress);
                    }
                    if (progress == 100) {
                        studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
                    }
                }
            } else if (studyRecordDto.getMaterialType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
                if (studyRecordDto.getLastPosition() > studyRecord.getLastPosition()) {
                    studyRecord.setLastPosition(studyRecordDto.getLastPosition());
                    int progress = studyRecordDto.getLastPosition() * 100 / studyRecordDto.getMaxDuration();
                    if (progress > studyRecord.getProgress()) {
                        studyRecord.setProgress(progress);
                    }
                    if (progress == 100) {
                        studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
                    }
                }
            } else {
                studyRecord.setProgress(100);
                studyRecord.setStatus(EduFlexConstants.STATUS_ENDED);
            }
            studyRecord.setDuration(studyRecord.getDuration() + studyRecordDto.getDuration());
            baseMapper.updateById(studyRecord);
            if (studyRecord.getProgress() == 100) {
                return "当前资料已学习完成";
            }
        }

        // 计算课程学习进度
        CourseChapterDto courseChapterDto = new CourseChapterDto();
        courseChapterDto.setCourseId(studyRecordDto.getCourseId());
        courseChapterDto.setUserId(studyRecordDto.getUserId());
        List<CourseChapterVo> courseChapterVos = courseChapterService.selectCourseChapterListWithProgress(courseChapterDto);
        int total = courseChapterVos.stream().mapToInt(CourseChapterVo::getProgress).sum();
        int progress = total / courseChapterVos.size();
        StudentCourse studentCourse = studentCourseService.getOne(new LambdaQueryWrapper<StudentCourse>().eq(StudentCourse::getCourseId, studyRecordDto.getCourseId())
                .eq(StudentCourse::getUserId, studyRecordDto.getUserId()));
        if (progress == 100) {
            // 课程学习完成
            studentCourse.setProgress(progress);
            studentCourse.setStatus(EduFlexConstants.STATUS_ENDED);
            studentCourseService.updateById(studentCourse);
        } else {
            // 更新课程学习进度
            studentCourse.setProgress(progress);
            studentCourse.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
            studentCourse.setUpdateBy(getUsername());
            studentCourseService.updateById(studentCourse);
        }
        return "记录上传成功";
    }

    @Override
    public List<StudyRecordVo> buildVo(List<StudyRecord> studyRecordList) {
        List<StudyRecordVo> studyRecordVoList = new ArrayList<>();
        for (StudyRecord studyRecord : studyRecordList) {
            StudyRecordVo studyRecordVo = new StudyRecordVo();

            BeanUtils.copyProperties(studyRecord, studyRecordVo);
            SysUser sysUser = userService.selectUserById(studyRecord.getUserId());
            studyRecordVo.setNickName(sysUser.getNickName());
            studyRecordVo.setUserName(sysUser.getUserName());
            studyRecordVo.setCourseName(courseService.getById(studyRecord.getCourseId()).getName());
            studyRecordVoList.add(studyRecordVo);
        }
        return studyRecordVoList;
    }
}

package com.eduflex.manage.study_record.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.study_record.domain.vo.StudyRecordVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.study_record.mapper.StudyRecordMapper;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.service.IStudyRecordService;

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
    private IStudentService studentService;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理
     */
    @Override
    public List<StudyRecordVo> selectStudyRecordList(StudyRecord studyRecord) {
        LambdaQueryWrapper<StudyRecord> wrapper = new LambdaQueryWrapper<StudyRecord>()
                .eq(studyRecord.getStudentId() != null, StudyRecord::getStudentId, studyRecord.getStudentId())
                .eq(studyRecord.getCourseId() != null, StudyRecord::getCourseId, studyRecord.getCourseId())
                .eq(studyRecord.getStatus() != null, StudyRecord::getStatus, studyRecord.getStatus());

        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public StudyRecordVo selectById(Long id) {
        return buildVo(baseMapper.selectById(id));
    }

    private StudyRecordVo buildVo(StudyRecord studyRecord) {
        StudyRecordVo studyRecordVo = new StudyRecordVo();
        BeanUtils.copyProperties(studyRecord, studyRecordVo);
        StudentVo student = studentService.selectStudentById(studyRecord.getStudentId());
        studyRecordVo.setNickName(userService.selectUserById(student.getUserId()).getNickName());
        studyRecordVo.setUserName(userService.selectUserById(student.getUserId()).getUserName());
        studyRecordVo.setCourseName(courseService.getById(studyRecord.getCourseId()).getName());
        return studyRecordVo;
    }

    private List<StudyRecordVo> buildVo(List<StudyRecord> studyRecordList) {
        List<StudyRecordVo> studyRecordVoList = new ArrayList<>();
        for (StudyRecord studyRecord : studyRecordList) {
            StudyRecordVo studyRecordVo = buildVo(studyRecord);

            studyRecordVoList.add(studyRecordVo);
        }
        return studyRecordVoList;
    }
}

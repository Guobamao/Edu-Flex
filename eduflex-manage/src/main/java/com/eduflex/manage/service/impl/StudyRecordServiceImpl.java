package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import com.eduflex.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.StudyRecordMapper;
import com.eduflex.manage.domain.StudyRecord;
import com.eduflex.manage.service.IStudyRecordService;

/**
 * 学习记录管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@Service
public class StudyRecordServiceImpl extends ServiceImpl<StudyRecordMapper, StudyRecord> implements IStudyRecordService {
    @Autowired
    private StudyRecordMapper studyRecordMapper;

    /**
     * 查询学习记录管理
     *
     * @param id 学习记录管理主键
     * @return 学习记录管理
     */
    @Override
    public StudyRecord selectStudyRecordById(Long id) {
        return studyRecordMapper.selectStudyRecordById(id);
    }

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理
     */
    @Override
    public List<StudyRecord> selectStudyRecordList(StudyRecord studyRecord) {
        return studyRecordMapper.selectStudyRecordList(studyRecord);
    }

    /**
     * 新增学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    @Override
    public int insertStudyRecord(StudyRecord studyRecord) {
                studyRecord.setCreateTime(DateUtils.getNowDate());
            return studyRecordMapper.insertStudyRecord(studyRecord);
    }

    /**
     * 修改学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    @Override
    public int updateStudyRecord(StudyRecord studyRecord) {
                studyRecord.setUpdateTime(DateUtils.getNowDate());
        return studyRecordMapper.updateStudyRecord(studyRecord);
    }

    /**
     * 批量删除学习记录管理
     *
     * @param ids 需要删除的学习记录管理主键
     * @return 结果
     */
    @Override
    public int deleteStudyRecordByIds(Long[] ids) {
        return studyRecordMapper.deleteStudyRecordByIds(ids);
    }

    /**
     * 删除学习记录管理信息
     *
     * @param id 学习记录管理主键
     * @return 结果
     */
    @Override
    public int deleteStudyRecordById(Long id) {
        return studyRecordMapper.deleteStudyRecordById(id);
    }
}

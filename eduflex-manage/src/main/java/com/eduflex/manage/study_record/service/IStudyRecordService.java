package com.eduflex.manage.study_record.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.study_record.domain.StudyRecord;
import com.eduflex.manage.study_record.domain.vo.StudyRecordVo;
import com.eduflex.user.study_record.domain.dto.StudyRecordDto;

import java.util.List;

/**
 * 学习记录管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
public interface IStudyRecordService extends IService<StudyRecord> {

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理集合
     */
    List<StudyRecord> selectStudyRecordList(StudyRecord studyRecord);

    /**
     * 根据id查询学习记录管理
     *
     * @param id 记录ID
     * @return 结果
     */
    StudyRecordVo selectById(Long id);

    /**
     * 保存学习记录
     *
     * @param studyRecordDto 查询条件
     * @return 结果
     */
    String saveStudyRecord(StudyRecordDto studyRecordDto);

    /**
     * 管理端 - 构建学习记录Vo集合
     *
     * @param studyRecordList 学习记录集合
     * @return 学习记录Vo集合
     */
    List<StudyRecordVo> buildVo(List<StudyRecord> studyRecordList);
}

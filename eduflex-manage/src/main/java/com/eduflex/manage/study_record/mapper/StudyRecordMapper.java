package com.eduflex.manage.study_record.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.study_record.domain.StudyRecord;

/**
 * 学习记录管理Mapper接口
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
public interface StudyRecordMapper extends BaseMapper<StudyRecord> {
    /**
     * 查询学习记录管理
     *
     * @param id 学习记录管理主键
     * @return 学习记录管理
     */
    StudyRecord selectStudyRecordById(Long id);

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理集合
     */
    List<StudyRecord> selectStudyRecordList(StudyRecord studyRecord);

    /**
     * 新增学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    int insertStudyRecord(StudyRecord studyRecord);

    /**
     * 修改学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    int updateStudyRecord(StudyRecord studyRecord);

    /**
     * 删除学习记录管理
     *
     * @param id 学习记录管理主键
     * @return 结果
     */
    int deleteStudyRecordById(Long id);

    /**
     * 批量删除学习记录管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteStudyRecordByIds(Long[] ids);
}

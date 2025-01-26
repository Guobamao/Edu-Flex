package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.StudyRecord;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 学习记录管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
public interface IStudyRecordService extends IService<StudyRecord> {
    /**
     * 查询学习记录管理
     *
     * @param id 学习记录管理主键
     * @return 学习记录管理
     */
    public StudyRecord selectStudyRecordById(Long id);

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理集合
     */
    public List<StudyRecord> selectStudyRecordList(StudyRecord studyRecord);

    /**
     * 新增学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    public int insertStudyRecord(StudyRecord studyRecord);

    /**
     * 修改学习记录管理
     *
     * @param studyRecord 学习记录管理
     * @return 结果
     */
    public int updateStudyRecord(StudyRecord studyRecord);

    /**
     * 批量删除学习记录管理
     *
     * @param ids 需要删除的学习记录管理主键集合
     * @return 结果
     */
    public int deleteStudyRecordByIds(Long[] ids);

    /**
     * 删除学习记录管理信息
     *
     * @param id 学习记录管理主键
     * @return 结果
     */
    public int deleteStudyRecordById(Long id);
}
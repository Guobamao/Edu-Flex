package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.StudyRecord;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.StudyRecordVo;

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
    StudyRecord selectStudyRecordById(Long id);

    /**
     * 查询学习记录管理列表
     *
     * @param studyRecord 学习记录管理
     * @return 学习记录管理集合
     */
    List<StudyRecordVo> selectStudyRecordList(StudyRecord studyRecord);

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
     * 批量删除学习记录管理
     *
     * @param ids 需要删除的学习记录管理主键集合
     * @return 结果
     */
    int deleteStudyRecordByIds(Long[] ids);
}

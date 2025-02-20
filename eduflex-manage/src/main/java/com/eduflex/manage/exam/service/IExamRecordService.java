package com.eduflex.manage.exam.service;

import java.util.List;

import com.eduflex.manage.exam.domain.ExamRecord;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.exam.domain.dto.ExamRecordDto;
import com.eduflex.manage.exam.domain.vo.ExamRecordVo;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamVo;

/**
 * 考试记录 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */

public interface IExamRecordService extends IService<ExamRecord> {
    /**
     * 查询考试记录列表
     *
     * @param examRecord 考试记录
     * @return 考试记录集合
     */
    List<ExamRecordVo> selectExamRecordList(ExamRecordDto examRecord);

    /**
     * 查询考生记录
     * @param id 记录ID
     * @return 考试记录
     */
    ExamRecordVo selectExamRecordById(Long id);

    /**
     * 学生端 - 获取考试列表
     * @param examDto 查询条件
     * @return 考试列表
     */
    List<ExamVo> selectExamRecordList(ExamDto examDto);

    /**
     * 创建考试
     *
     * @param examDto 查询条件
     * @return 考试记录ID
     */
    Long createExam(ExamDto examDto);
}

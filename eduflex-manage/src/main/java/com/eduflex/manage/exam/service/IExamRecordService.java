package com.eduflex.manage.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.manage.exam.domain.PendingDto;
import com.eduflex.manage.exam.domain.vo.ExamRecordVo;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamResultVo;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.quartz.SchedulerException;

import java.util.List;

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
    List<ExamRecord> selectExamRecordList(ExamRecord examRecord);

    /**
     * 查询考试记录
     *
     * @param id 记录ID
     * @return 考试记录
     */
    ExamRecordVo selectExamRecordById(Long id);

    /**
     * 学生端 - 获取考试列表
     *
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
    Long createExam(ExamDto examDto) throws SchedulerException, TaskException;

    /**
     * 交卷操作
     *
     * @param recordId 考试记录ID
     */
    void handExam(Long recordId);

    /**
     * 获取考试结果
     *
     * @param id 考试记录ID
     * @return 考试结果
     */
    ExamResultVo selectExamResultById(Long id);

    /**
     * 检查进行中的考试
     *
     * @param userId 用户ID
     * @return 结果
     */
    ExamRecord checkExam(Long userId);

    /**
     * 构建考试记录Vo集合
     *
     * @param examRecordList 考试记录集合
     * @return 考试记录Vo集合
     */
    List<ExamRecordVo> buildVo(List<ExamRecord> examRecordList);

    /**
     * 批阅考试题目
     *
     * @param pendingDto 批阅条件
     * @return 结果
     */
    Boolean pending(PendingDto pendingDto);
}

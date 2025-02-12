package com.eduflex.manage.exam.service;

import java.util.List;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.exam.domain.dto.ExamRecordDto;
import com.eduflex.manage.exam.domain.vo.ExamRecordVo;

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
}

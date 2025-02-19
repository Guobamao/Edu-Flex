package com.eduflex.manage.exam.service;

import java.util.List;
import com.eduflex.manage.exam.domain.Exam;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.exam.domain.vo.ExamVo;
import com.eduflex.user.exam.domain.dto.ExamDto;

/**
 * 考试管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
public interface IExamService extends IService<Exam> {
    /**
     * 查询考试管理列表
     *
     * @param exam 考试管理
     * @return 考试管理集合
     */
    List<ExamVo> selectExamList(Exam exam);
}

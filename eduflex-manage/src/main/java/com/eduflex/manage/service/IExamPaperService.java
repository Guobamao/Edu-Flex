package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.ExamPaper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.ExamPaperVo;

/**
 * 试卷管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IExamPaperService extends IService<ExamPaper> {
    /**
     * 查询试卷管理列表
     *
     * @param examPaper 试卷管理
     * @return 试卷管理集合
     */
    List<ExamPaperVo> selectExamPaperList(ExamPaper examPaper);
}

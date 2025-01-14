package com.eduflex.manage.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.ExamPaper;

/**
 * 试卷管理Mapper接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface ExamPaperMapper extends BaseMapper<ExamPaper> {
    /**
     * 查询试卷管理
     *
     * @param id 试卷管理主键
     * @return 试卷管理
     */
    public ExamPaper selectExamPaperById(Long id);

    /**
     * 查询试卷管理列表
     *
     * @param examPaper 试卷管理
     * @return 试卷管理集合
     */
    public List<ExamPaper> selectExamPaperList(ExamPaper examPaper);

    /**
     * 新增试卷管理
     *
     * @param examPaper 试卷管理
     * @return 结果
     */
    public int insertExamPaper(ExamPaper examPaper);

    /**
     * 修改试卷管理
     *
     * @param examPaper 试卷管理
     * @return 结果
     */
    public int updateExamPaper(ExamPaper examPaper);

    /**
     * 删除试卷管理
     *
     * @param id 试卷管理主键
     * @return 结果
     */
    public int deleteExamPaperById(Long id);

    /**
     * 批量删除试卷管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamPaperByIds(Long[] ids);
}
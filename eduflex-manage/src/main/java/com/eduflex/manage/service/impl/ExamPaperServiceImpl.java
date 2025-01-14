package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import com.eduflex.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.ExamPaperMapper;
import com.eduflex.manage.domain.ExamPaper;
import com.eduflex.manage.service.IExamPaperService;

/**
 * 试卷管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class ExamPaperServiceImpl extends ServiceImpl<ExamPaperMapper, ExamPaper> implements IExamPaperService {
    @Autowired
    private ExamPaperMapper examPaperMapper;

    /**
     * 查询试卷管理
     *
     * @param id 试卷管理主键
     * @return 试卷管理
     */
    @Override
    public ExamPaper selectExamPaperById(Long id) {
        return examPaperMapper.selectExamPaperById(id);
    }

    /**
     * 查询试卷管理列表
     *
     * @param examPaper 试卷管理
     * @return 试卷管理
     */
    @Override
    public List<ExamPaper> selectExamPaperList(ExamPaper examPaper) {
        return examPaperMapper.selectExamPaperList(examPaper);
    }

    /**
     * 新增试卷管理
     *
     * @param examPaper 试卷管理
     * @return 结果
     */
    @Override
    public int insertExamPaper(ExamPaper examPaper) {
                examPaper.setCreateTime(DateUtils.getNowDate());
            return examPaperMapper.insertExamPaper(examPaper);
    }

    /**
     * 修改试卷管理
     *
     * @param examPaper 试卷管理
     * @return 结果
     */
    @Override
    public int updateExamPaper(ExamPaper examPaper) {
                examPaper.setUpdateTime(DateUtils.getNowDate());
        return examPaperMapper.updateExamPaper(examPaper);
    }

    /**
     * 批量删除试卷管理
     *
     * @param ids 需要删除的试卷管理主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperByIds(Long[] ids) {
        return examPaperMapper.deleteExamPaperByIds(ids);
    }

    /**
     * 删除试卷管理信息
     *
     * @param id 试卷管理主键
     * @return 结果
     */
    @Override
    public int deleteExamPaperById(Long id) {
        return examPaperMapper.deleteExamPaperById(id);
    }
}

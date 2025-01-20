package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

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

    @Override
    public List<ExamPaper> selectExamPaperList(ExamPaper examPaper) {
        LambdaQueryWrapper<ExamPaper> wrapper = new LambdaQueryWrapper<ExamPaper>()
                .like(StrUtil.isNotBlank(examPaper.getTitle()), ExamPaper::getTitle, examPaper.getTitle())
                .eq(examPaper.getIsPublished() != null, ExamPaper::getIsPublished, examPaper.getIsPublished());

        return baseMapper.selectList(wrapper);
    }
}

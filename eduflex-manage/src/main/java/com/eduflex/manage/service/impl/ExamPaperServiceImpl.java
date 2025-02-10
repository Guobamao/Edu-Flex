package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.manage.domain.vo.ExamPaperVo;
import com.eduflex.manage.service.ICourseService;
import org.springframework.beans.BeanUtils;
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
    private ICourseService courseService;

    @Override
    public List<ExamPaperVo> selectExamPaperList(ExamPaper examPaper) {
        LambdaQueryWrapper<ExamPaper> wrapper = new LambdaQueryWrapper<ExamPaper>()
                .like(StrUtil.isNotBlank(examPaper.getTitle()), ExamPaper::getTitle, examPaper.getTitle())
                .eq(examPaper.getCourseId() != null, ExamPaper::getCourseId, examPaper.getCourseId());
        return buildVo(baseMapper.selectList(wrapper));
    }

    private List<ExamPaperVo> buildVo(List<ExamPaper> examPaperList) {
        List<ExamPaperVo> examPaperVoList = new ArrayList<>();
        for (ExamPaper examPaper : examPaperList) {
            ExamPaperVo examPaperVo = new ExamPaperVo();
            BeanUtils.copyProperties(examPaper, examPaperVo);
            examPaperVo.setCourseName(courseService.getById(examPaper.getCourseId()).getName());
            examPaperVoList.add(examPaperVo);
        }
        return examPaperVoList;
    }
}

package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.domain.ExamPaperRepo;
import com.eduflex.manage.mapper.ExamPaperRepoMapper;
import com.eduflex.manage.service.IExamPaperRepoService;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 试卷题库关联 Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-10
 */
@Service
public class ExamPaperRepoServiceImpl extends ServiceImpl<ExamPaperRepoMapper, ExamPaperRepo> implements IExamPaperRepoService {

    @Override
    public List<ExamPaperRepo> selectRepoByPaperId(Long id) {
        LambdaQueryWrapper<ExamPaperRepo> wrapper = new LambdaQueryWrapper<ExamPaperRepo>()
                .eq(ExamPaperRepo::getPaperId, id);
        return baseMapper.selectList(wrapper);
    }
}

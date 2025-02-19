package com.eduflex.manage.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.manage.exam.domain.vo.ExamVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.paper.service.IPaperService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.exam.mapper.ExamMapper;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.service.IExamService;

/**
 * 考试管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements IExamService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IPaperService paperService;

    @Override
    public List<ExamVo> selectExamList(Exam exam) {
        LambdaQueryWrapper<Exam> wrapper = new LambdaQueryWrapper<Exam>()
                .eq(exam.getCourseId() != null, Exam::getCourseId, exam.getCourseId())
                .eq(exam.getStatus() != null, Exam::getStatus, exam.getStatus())
                .eq(exam.getPublished() != null, Exam::getPublished, exam.getPublished())
                .like(StrUtil.isNotBlank(exam.getName()), Exam::getName, exam.getName());
        return buildVo(baseMapper.selectList(wrapper));
    }

    private List<ExamVo> buildVo(List<Exam> examList) {
        List<ExamVo> examVoList = new ArrayList<>();
        for (Exam exam : examList) {
            ExamVo examVo = new ExamVo();
            BeanUtils.copyProperties(exam, examVo);
            examVo.setCourseName(courseService.getById(exam.getCourseId()).getName());
            examVo.setPaperName(paperService.getById(exam.getPaperId()).getTitle());
            examVoList.add(examVo);
        }
        return examVoList;
    }
}

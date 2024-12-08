package com.eduflex.manage.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.GradeMapper;
import com.eduflex.manage.domain.Grade;
import com.eduflex.manage.service.IGradeService;

/**
 * 班级管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Service
public class GradeServiceImpl extends ServiceImpl<GradeMapper, Grade> implements IGradeService
{
    @Autowired
    private GradeMapper gradeMapper;

    /**
     * 查询班级管理列表
     * 
     * @param grade 班级管理
     * @return 班级管理
     */
    @Override
    public List<Grade> selectGradeList(Grade grade)
    {
        LambdaQueryWrapper<Grade> wrapper = new LambdaQueryWrapper<Grade>()
                .eq(grade.getCollegeId() != null, Grade::getCollegeId, grade.getCollegeId())
                .like(grade.getName() != null && !grade.getName().isEmpty(), Grade::getName, grade.getName());
        return gradeMapper.selectList(wrapper);
    }
}

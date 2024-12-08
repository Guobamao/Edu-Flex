package com.eduflex.manage.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.SemesterMapper;
import com.eduflex.manage.domain.Semester;
import com.eduflex.manage.service.ISemesterService;

/**
 * 学期管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Service
public class SemesterServiceImpl extends ServiceImpl<SemesterMapper, Semester> implements ISemesterService
{
    @Autowired
    private SemesterMapper semesterMapper;

    /**
     * 查询学期管理列表
     * 
     * @param semester 学期管理
     * @return 学期管理
     */
    @Override
    public List<Semester> selectSemesterList(Semester semester)
    {
        LambdaQueryWrapper<Semester> wrapper = new LambdaQueryWrapper<Semester>()
                .like(semester.getName() != null && !semester.getName().isEmpty(), Semester::getName, semester.getName());
        return semesterMapper.selectList(wrapper);
    }
}

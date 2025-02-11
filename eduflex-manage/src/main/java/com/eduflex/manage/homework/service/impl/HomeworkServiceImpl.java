package com.eduflex.manage.homework.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.eduflex.manage.homework.mapper.HomeworkMapper;
import com.eduflex.manage.homework.domain.Homework;
import com.eduflex.manage.homework.service.IHomeworkService;

/**
 * 作业管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-11-23
 */
@Service
public class HomeworkServiceImpl extends ServiceImpl<HomeworkMapper, Homework> implements IHomeworkService
{
    /**
     * 查询作业管理列表
     *
     * @param homework 作业管理
     * @return 作业管理
     */
    @Override
    public List<Homework> selectHomeworkList(Homework homework)
    {
        LambdaQueryWrapper<Homework> wrapper = new LambdaQueryWrapper<Homework>()
                .eq(homework.getCourseId() != null, Homework::getCourseId, homework.getCourseId())
                .like(homework.getTitle() != null && !homework.getTitle().isEmpty(), Homework::getTitle, homework.getTitle())
                .ge(homework.getParams().get("startTime") != null, Homework::getDeadline, homework.getParams().get("startTime"))
                .le(homework.getParams().get("endTime") != null, Homework::getDeadline, homework.getParams().get("endTime"));
        return baseMapper.selectList(wrapper);
    }
}

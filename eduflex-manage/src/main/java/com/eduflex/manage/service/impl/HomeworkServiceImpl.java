package com.eduflex.manage.service.impl;

import java.util.List;
import com.eduflex.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.HomeworkMapper;
import com.eduflex.manage.domain.Homework;
import com.eduflex.manage.service.IHomeworkService;

/**
 * 作业管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-11-23
 */
@Service
public class HomeworkServiceImpl implements IHomeworkService 
{
    @Autowired
    private HomeworkMapper homeworkMapper;

    /**
     * 查询作业管理
     * 
     * @param id 作业管理主键
     * @return 作业管理
     */
    @Override
    public Homework selectHomeworkById(Long id)
    {
        return homeworkMapper.selectHomeworkById(id);
    }

    /**
     * 查询作业管理列表
     * 
     * @param homework 作业管理
     * @return 作业管理
     */
    @Override
    public List<Homework> selectHomeworkList(Homework homework)
    {
        return homeworkMapper.selectHomeworkList(homework);
    }

    /**
     * 新增作业管理
     * 
     * @param homework 作业管理
     * @return 结果
     */
    @Override
    public int insertHomework(Homework homework)
    {
        homework.setCreateTime(DateUtils.getNowDate());
        return homeworkMapper.insertHomework(homework);
    }

    /**
     * 修改作业管理
     * 
     * @param homework 作业管理
     * @return 结果
     */
    @Override
    public int updateHomework(Homework homework)
    {
        homework.setUpdateTime(DateUtils.getNowDate());
        return homeworkMapper.updateHomework(homework);
    }

    /**
     * 批量删除作业管理
     * 
     * @param ids 需要删除的作业管理主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkByIds(Long[] ids)
    {
        return homeworkMapper.deleteHomeworkByIds(ids);
    }

    /**
     * 删除作业管理信息
     * 
     * @param id 作业管理主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkById(Long id)
    {
        return homeworkMapper.deleteHomeworkById(id);
    }
}

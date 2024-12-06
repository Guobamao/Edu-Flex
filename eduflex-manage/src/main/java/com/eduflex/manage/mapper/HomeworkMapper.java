package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.Homework;

/**
 * 作业管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-11-23
 */
public interface HomeworkMapper 
{
    /**
     * 查询作业管理
     * 
     * @param id 作业管理主键
     * @return 作业管理
     */
    public Homework selectHomeworkById(Long id);

    /**
     * 查询作业管理列表
     * 
     * @param homework 作业管理
     * @return 作业管理集合
     */
    public List<Homework> selectHomeworkList(Homework homework);

    /**
     * 新增作业管理
     * 
     * @param homework 作业管理
     * @return 结果
     */
    public int insertHomework(Homework homework);

    /**
     * 修改作业管理
     * 
     * @param homework 作业管理
     * @return 结果
     */
    public int updateHomework(Homework homework);

    /**
     * 删除作业管理
     * 
     * @param id 作业管理主键
     * @return 结果
     */
    public int deleteHomeworkById(Long id);

    /**
     * 批量删除作业管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHomeworkByIds(Long[] ids);
}

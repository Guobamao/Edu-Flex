package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.Homework;

/**
 * 作业管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-11-23
 */
public interface IHomeworkService extends IService<Homework>
{
    /**
     * 查询作业管理列表
     * 
     * @param homework 作业管理
     * @return 作业管理集合
     */
    public List<Homework> selectHomeworkList(Homework homework);

}

package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.Grade;

/**
 * 班级管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface IGradeService extends IService<Grade>
{

    /**
     * 查询班级管理列表
     * 
     * @param grade 班级管理
     * @return 班级管理集合
     */
    public List<Grade> selectGradeList(Grade grade);

}

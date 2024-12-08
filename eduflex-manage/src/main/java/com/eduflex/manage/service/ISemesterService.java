package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.Semester;

/**
 * 学期管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface ISemesterService extends IService<Semester>
{
    /**
     * 查询学期管理列表
     * 
     * @param semester 学期管理
     * @return 学期管理集合
     */
    public List<Semester> selectSemesterList(Semester semester);
}

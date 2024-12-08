package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.College;

/**
 * 学院管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface ICollegeService extends IService<College>
{
    /**
     * 查询学院管理列表
     * 
     * @param college 学院管理
     * @return 学院管理集合
     */
    public List<College> selectCollegeList(College college);

    /**
     * 新增学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    public int insertCollege(College college);

    /**
     * 修改学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    public int updateCollege(College college);

    /**
     * 检验学院名称唯一性
     * @param college
     * @return
     */
    boolean checkCollegeNameUnique(College college);

    /**
     * 检验学院是否有子学院
     * @param collegeId 学院ID
     * @return
     */
    boolean hasChildByCollegeId(Long collegeId);

}

package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.Semester;

/**
 * 学期管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface SemesterMapper 
{
    /**
     * 查询学期管理
     * 
     * @param id 学期管理主键
     * @return 学期管理
     */
    public Semester selectSemesterById(Long id);

    /**
     * 查询学期管理列表
     * 
     * @param semester 学期管理
     * @return 学期管理集合
     */
    public List<Semester> selectSemesterList(Semester semester);

    /**
     * 新增学期管理
     * 
     * @param semester 学期管理
     * @return 结果
     */
    public int insertSemester(Semester semester);

    /**
     * 修改学期管理
     * 
     * @param semester 学期管理
     * @return 结果
     */
    public int updateSemester(Semester semester);

    /**
     * 删除学期管理
     * 
     * @param id 学期管理主键
     * @return 结果
     */
    public int deleteSemesterById(Long id);

    /**
     * 批量删除学期管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSemesterByIds(Long[] ids);
}

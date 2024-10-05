package com.eduflex.manage.service.impl;

import java.util.List;
import com.eduflex.common.utils.DateUtils;
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
public class SemesterServiceImpl implements ISemesterService 
{
    @Autowired
    private SemesterMapper semesterMapper;

    /**
     * 查询学期管理
     * 
     * @param id 学期管理主键
     * @return 学期管理
     */
    @Override
    public Semester selectSemesterById(Long id)
    {
        return semesterMapper.selectSemesterById(id);
    }

    /**
     * 查询学期管理列表
     * 
     * @param semester 学期管理
     * @return 学期管理
     */
    @Override
    public List<Semester> selectSemesterList(Semester semester)
    {
        return semesterMapper.selectSemesterList(semester);
    }

    /**
     * 新增学期管理
     * 
     * @param semester 学期管理
     * @return 结果
     */
    @Override
    public int insertSemester(Semester semester)
    {
        semester.setCreateTime(DateUtils.getNowDate());
        return semesterMapper.insertSemester(semester);
    }

    /**
     * 修改学期管理
     * 
     * @param semester 学期管理
     * @return 结果
     */
    @Override
    public int updateSemester(Semester semester)
    {
        semester.setUpdateTime(DateUtils.getNowDate());
        return semesterMapper.updateSemester(semester);
    }

    /**
     * 批量删除学期管理
     * 
     * @param ids 需要删除的学期管理主键
     * @return 结果
     */
    @Override
    public int deleteSemesterByIds(Long[] ids)
    {
        // TODO: 增加是否关联课程的判断
        return semesterMapper.deleteSemesterByIds(ids);
    }

    /**
     * 删除学期管理信息
     * 
     * @param id 学期管理主键
     * @return 结果
     */
    @Override
    public int deleteSemesterById(Long id)
    {
        return semesterMapper.deleteSemesterById(id);
    }
}

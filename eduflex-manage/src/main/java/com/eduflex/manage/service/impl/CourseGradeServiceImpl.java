package com.eduflex.manage.service.impl;

import java.util.List;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.dto.CourseGradeDto;
import com.eduflex.manage.domain.vo.CourseGradeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseGradeMapper;
import com.eduflex.manage.domain.CourseGrade;
import com.eduflex.manage.service.ICourseGradeService;

/**
 * 班级课程管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
@Service
public class CourseGradeServiceImpl implements ICourseGradeService 
{
    @Autowired
    private CourseGradeMapper courseGradeMapper;

    /**
     * 查询班级课程管理
     * 
     * @param id 班级课程管理主键
     * @return 班级课程管理
     */
    @Override
    public CourseGrade selectCourseGradeById(Long id)
    {
        return courseGradeMapper.selectCourseGradeById(id);
    }

    /**
     * 查询班级课程管理列表
     *
     * @param courseGradeDto 班级课程管理
     * @return 班级课程管理
     */
    @Override
    public List<CourseGradeVo> selectCourseGradeList(CourseGradeDto courseGradeDto)
    {
        return courseGradeMapper.selectCourseGradeList(courseGradeDto);
    }

    /**
     * 新增班级课程管理
     * 
     * @param courseGrade 班级课程管理
     * @return 结果
     */
    @Override
    public int insertCourseGrade(CourseGrade courseGrade)
    {
        courseGrade.setCreateTime(DateUtils.getNowDate());
        return courseGradeMapper.insertCourseGrade(courseGrade);
    }

    /**
     * 修改班级课程管理
     * 
     * @param courseGrade 班级课程管理
     * @return 结果
     */
    @Override
    public int updateCourseGrade(CourseGrade courseGrade)
    {
        courseGrade.setUpdateTime(DateUtils.getNowDate());
        return courseGradeMapper.updateCourseGrade(courseGrade);
    }

    /**
     * 批量删除班级课程管理
     * 
     * @param ids 需要删除的班级课程管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseGradeByIds(Long[] ids)
    {
        return courseGradeMapper.deleteCourseGradeByIds(ids);
    }

    /**
     * 删除班级课程管理信息
     * 
     * @param id 班级课程管理主键
     * @return 结果
     */
    @Override
    public int deleteCourseGradeById(Long id)
    {
        return courseGradeMapper.deleteCourseGradeById(id);
    }
}

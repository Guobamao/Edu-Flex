package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.CourseGrade;
import com.eduflex.manage.domain.dto.CourseGradeDto;
import com.eduflex.manage.domain.vo.CourseGradeVo;

/**
 * 班级课程管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
public interface CourseGradeMapper 
{
    /**
     * 查询班级课程管理
     * 
     * @param id 班级课程管理主键
     * @return 班级课程管理
     */
    public CourseGrade selectCourseGradeById(Long id);

    /**
     * 查询班级课程管理列表
     * 
     * @param courseGradedDto 班级课程管理
     * @return 班级课程管理集合
     */
    public List<CourseGradeVo> selectCourseGradeList(CourseGradeDto courseGradedDto);

    /**
     * 新增班级课程管理
     * 
     * @param courseGrade 班级课程管理
     * @return 结果
     */
    public int insertCourseGrade(CourseGrade courseGrade);

    /**
     * 修改班级课程管理
     * 
     * @param courseGrade 班级课程管理
     * @return 结果
     */
    public int updateCourseGrade(CourseGrade courseGrade);

    /**
     * 删除班级课程管理
     * 
     * @param id 班级课程管理主键
     * @return 结果
     */
    public int deleteCourseGradeById(Long id);

    /**
     * 批量删除班级课程管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseGradeByIds(Long[] ids);

    /**
     * 查询班级课程管理是否已存在
     * @param courseGrade
     * @return
     */
    int selectCourseGradeByGradeIdAndCourseId(CourseGrade courseGrade);
}

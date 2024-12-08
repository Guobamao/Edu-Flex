package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.CourseGrade;
import com.eduflex.manage.domain.dto.CourseGradeDto;
import com.eduflex.manage.domain.vo.CourseGradeVo;

/**
 * 班级课程管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
public interface ICourseGradeService extends IService<CourseGrade>
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
     * @param courseGradeDto 班级课程管理
     * @return 班级课程管理集合
     */
    public List<CourseGradeVo> selectCourseGradeList(CourseGradeDto courseGradeDto);

    /**
     * 根据班级id和课程id查询班级课程管理
     * @param courseGrade
     * @return
     */
    boolean selectCourseGradeByGradeIdAndCourseId(CourseGrade courseGrade);
}

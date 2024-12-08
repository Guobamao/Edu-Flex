package com.eduflex.manage.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.CourseGrade;
import com.eduflex.manage.domain.vo.CourseGradeVo;
import org.apache.ibatis.annotations.Param;

/**
 * 班级课程管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
public interface CourseGradeMapper extends BaseMapper<CourseGrade>
{
    /**
     * 查询班级课程管理
     * 
     * @param id 班级课程管理主键
     * @return 班级课程管理
     */
    CourseGrade selectCourseGradeById(Long id);

    /**
     * 查询班级课程管理列表
     * 
     * @param wrapper 班级课程管理
     * @return 班级课程管理集合
     */
    List<CourseGradeVo> selectCourseGradeList(@Param("ew") QueryWrapper wrapper);

    /**
     * 查询班级课程管理是否已存在
     * @param courseGrade 班级课程管理
     * @return 记录数
     */
    int selectCourseGradeByGradeIdAndCourseId(CourseGrade courseGrade);
}

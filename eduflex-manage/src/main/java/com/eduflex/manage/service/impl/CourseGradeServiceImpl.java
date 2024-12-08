package com.eduflex.manage.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class CourseGradeServiceImpl extends ServiceImpl<CourseGradeMapper, CourseGrade> implements ICourseGradeService
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
        QueryWrapper<CourseGrade> wrapper = new QueryWrapper<CourseGrade>()
                .eq(courseGradeDto.getCourseId() != null, "cg.course_id", courseGradeDto.getCourseId())
                .eq(courseGradeDto.getGradeId() != null, "cg.grade_id", courseGradeDto.getGradeId())
                .like(courseGradeDto.getCourseName() != null && !courseGradeDto.getCourseName().isEmpty(), "c.name", courseGradeDto.getCourseName())
                .like(courseGradeDto.getGradeName() != null && !courseGradeDto.getGradeName().isEmpty(), "g.name", courseGradeDto.getGradeName());
        wrapper.eq("cg.deleted", 0);
        return courseGradeMapper.selectCourseGradeList(wrapper);
    }

    /**
     * 查询班级课程管理是否已存在
     * @param courseGrade 班级课程管理
     * @return 布尔值
     */
    @Override
    public boolean selectCourseGradeByGradeIdAndCourseId(CourseGrade courseGrade) {
        return courseGradeMapper.selectCourseGradeByGradeIdAndCourseId(courseGrade) > 0;
    }
}

package com.eduflex.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 班级课程管理对象 tb_course_grade
 * 
 * @author 林煜鋒
 * @date 2024-10-11
 */
public class CourseGrade extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关系主键 */
    private Long id;

    /** 课程ID */
    @Excel(name = "课程ID")
    private Long courseId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long gradeId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }
    public void setGradeId(Long gradeId) 
    {
        this.gradeId = gradeId;
    }

    public Long getGradeId() 
    {
        return gradeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("courseId", getCourseId())
            .append("gradeId", getGradeId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}

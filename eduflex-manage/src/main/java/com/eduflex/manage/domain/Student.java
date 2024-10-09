package com.eduflex.manage.domain;

import com.eduflex.common.core.domain.entity.SysUser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 学生管理对象 tb_student
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student extends SysUser
{
    private static final long serialVersionUID = 1L;

    /** 学生ID */
    private Long id;

    /** 关联sys_user表的ID */
    private Long userId;

    /** 所属学院ID */
    @Excel(name = "所属学院ID")
    private Long collegeId;

    /** 所属班级ID */
    @Excel(name = "所属班级ID")
    private Long gradeId;
}

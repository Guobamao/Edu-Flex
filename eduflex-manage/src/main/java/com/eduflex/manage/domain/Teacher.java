package com.eduflex.manage.domain;

import com.eduflex.common.core.domain.entity.SysUser;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 教师管理对象 tb_teacher
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Data
public class Teacher extends SysUser
{
    private static final long serialVersionUID = 1L;

    /** 教师ID */
    private Long id;

    /** 关联sys_user表的id */
    private Long userId;

    /** 所属学院ID */
    @Excel(name = "所属学院ID")
    private Long collegeId;
}

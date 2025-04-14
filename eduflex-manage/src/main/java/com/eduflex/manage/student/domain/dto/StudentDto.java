package com.eduflex.manage.student.domain.dto;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.student.domain.Student;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Administrator
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class StudentDto extends Student {
    @Excel(name = "登录名称")
    private String userName;
    @Excel(name = "用户名称")
    private String nickName;
    @Excel(name = "用户邮箱")
    private String email;
    @Excel(name = "手机号码", cellType = Excel.ColumnType.TEXT)
    private String phonenumber;
    private Integer sex;
    // 状态：0正常 1停用
    private Integer status;
    @Excel(name = "登录密码（默认Axy+登录名称）")
    private String password;
    private Long avatar;
    // 角色ID
    private Long roleId;

    private String searchValue;
}

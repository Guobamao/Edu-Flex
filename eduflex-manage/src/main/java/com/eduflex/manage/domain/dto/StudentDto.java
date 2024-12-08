package com.eduflex.manage.domain.dto;

import com.eduflex.manage.domain.Student;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Administrator
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class StudentDto extends Student {
    private String userName;
    private String nickName;
    private String email;
    private String phonenumber;
    private String sex;
    // 状态：0正常 1停用
    private String status;
    private String password;
    private String avatar;
    // 角色ID
    private Long roleId;
}

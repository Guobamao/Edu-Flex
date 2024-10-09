package com.eduflex.manage.domain.dto;

import com.eduflex.manage.domain.Student;
import lombok.Data;

@Data
public class StudentDto extends Student {
    private String userName;
    private String nickName;
    private String email;
    private String phonenumber;
    private String sex;
    private String status; // 状态：0正常 1停用
    private String password;
    private String avatar;
    private Long roleId; // 角色ID
}

package com.eduflex.manage.teacher.domain.dto;

import com.eduflex.manage.teacher.domain.Teacher;
import lombok.Data;

@Data
public class TeacherDto extends Teacher {
    private String userName;
    private String nickName;
    private String email;
    private String phonenumber;
    private String sex;
    private Long avatar;
    private String password;
    private String status; // 状态：0启用，1停用
    private Long roleId; // 角色ID
}

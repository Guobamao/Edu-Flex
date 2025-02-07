package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Teacher;
import lombok.Data;

import java.util.Date;

@Data
public class TeacherVo extends Teacher {
    private String nickName;
    private String userName;
    private String email;
    private String phonenumber;
    private String sex;
    private String avatar;
    private String status;
    private String loginIp;
    private Date loginDate;
}

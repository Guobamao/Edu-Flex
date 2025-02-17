package com.eduflex.manage.teacher.domain.vo;

import com.eduflex.manage.teacher.domain.Teacher;
import lombok.Data;

import java.util.Date;

/**
 * 教室Vo
 */
@Data
public class TeacherVo extends Teacher {
    private String nickName;
    private String userName;
    private String email;
    private String phonenumber;
    private String sex;
    private Long avatar;
    private String status;
    private String loginIp;
    private Date loginDate;
}

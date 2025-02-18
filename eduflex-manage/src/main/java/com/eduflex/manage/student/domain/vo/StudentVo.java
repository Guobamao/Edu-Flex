package com.eduflex.manage.student.domain.vo;

import lombok.Data;

import java.util.Date;

@Data
public class StudentVo {
    private Long id;
    private Long userId;
    private String nickName;
    private String userName;
    private String email;
    private String phonenumber;
    private Integer sex;
    private Long avatar;
    private Integer status;
    private String loginIp;
    private Date loginDate;
}

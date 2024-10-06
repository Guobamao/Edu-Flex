package com.eduflex.manage.domain.dto;

import com.eduflex.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class TeacherDto extends BaseEntity {
    private Long id;
    private Long userId;
    private Long collegeId;
    private String userName;
    private String nickName;
    private String email;
    private String phonenumber;
    private String sex;
    private String avatar;
    private String password;
    private String status; // 状态：0启用，1停用
    private Long roleId; // 角色ID
}

package com.eduflex.manage.student.domain.vo;

import com.eduflex.common.annotation.Excel;
import lombok.Data;

import java.util.Date;

@Data
public class StudentVo {
    @Excel(name = "用户序号")
    private Long userId;
    @Excel(name = "登录名称")
    private String userName;
    @Excel(name = "用户昵称")
    private String nickName;
    @Excel(name = "用户邮箱")
    private String email;
    @Excel(name = "手机号码", cellType = Excel.ColumnType.TEXT)
    private String phonenumber;
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private Integer sex;
    private Long avatar;
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private Integer status;
    @Excel(name = "最后登录IP")
    private String loginIp;
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date loginDate;
}

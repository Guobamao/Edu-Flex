package com.eduflex.manage.homework.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.homework.domain.HomeworkStudent;
import lombok.Data;

@Data
public class HomeworkStudentVo extends HomeworkStudent {

    @Excel(name = "用户名", sort = 1)
    private String userName;
    @Excel(name = "昵称", sort = 2)
    private String nickName;
    @Excel(name = "课程名称", sort = 3)
    private String courseName;
}

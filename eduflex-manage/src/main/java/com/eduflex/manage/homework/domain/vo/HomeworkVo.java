package com.eduflex.manage.homework.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.homework.domain.Homework;
import lombok.Data;

@Data
public class HomeworkVo extends Homework {

    @Excel(name = "课程名称", sort = 1)
    private String courseName;

    @Excel(name = "已提交作业", sort = 3)
    private Integer submitCount;
}

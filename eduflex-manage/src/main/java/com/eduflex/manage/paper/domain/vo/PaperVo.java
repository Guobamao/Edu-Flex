package com.eduflex.manage.paper.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.paper.domain.Paper;
import lombok.Data;

@Data
public class PaperVo extends Paper {
    @Excel(name = "课程名称", sort = 1)
    private String courseName;
}

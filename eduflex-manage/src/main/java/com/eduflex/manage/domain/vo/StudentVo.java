package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.Student;
import lombok.Data;

@Data
public class StudentVo extends Student {
    private String collegeName; // 学院名称
    private String gradeName; // 班级名称
}

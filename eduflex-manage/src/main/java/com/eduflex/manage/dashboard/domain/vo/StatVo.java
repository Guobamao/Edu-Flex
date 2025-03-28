package com.eduflex.manage.dashboard.domain.vo;

import lombok.Data;

/**
 * 统计数据Vo
 */
@Data
public class StatVo {
    // 学生人数
    private Integer studentCount;
    // 教师人数
    private Integer teacherCount;
    // 课程总数
    private Integer courseCount;
    // 资源总数
    private Integer resourceCount;
}

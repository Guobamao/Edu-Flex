package com.eduflex.manage.dashboard.domain.vo;

import lombok.Data;

/**
 * 热门课程Vo
 * @author 林煜鋒
 */
@Data
public class TopCourseVo {
    private Long courseId;
    private String courseName;
    private Integer count;
}

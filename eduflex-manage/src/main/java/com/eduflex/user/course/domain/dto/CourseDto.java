package com.eduflex.user.course.domain.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

/**
 * 用户端 课程列表DTO
 * @author 林煜鋒
 */
@Alias("UserCourseDto")
@Data
public class CourseDto {
    private Long directionId;
    private Long categoryId;
    private Integer status;
    private String type;
}

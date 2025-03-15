package com.eduflex.user.goal.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 用户学习目标视图对象
 * @author 林煜鋒
 */
@Data
public class UserGoalVo {
    private Long id;
    private String goalName;
    private String description;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deadline;
    private Integer status;
}

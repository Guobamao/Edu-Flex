package com.eduflex.user.evaluation.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 用户端 - 课程评价 Vo对象
 *
 * @author 林煜鋒
 */
@Data
public class UserEvaluationVo {
    // 课程ID
    private Long courseId;
    // 课程名称
    private String courseName;
    // 评价者名称
    private String nickName;
    // 评分
    private Integer score;
    // 评论内容
    private String content;
    // 头像
    private Long avatar;
    // 评论时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}

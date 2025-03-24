package com.eduflex.manage.evaluation.domain.vo;

import com.eduflex.manage.evaluation.domain.Evaluation;
import lombok.Data;

/**
 * 课程评价管理视图对象
 * @author 林煜鋒
 */
@Data
public class EvaluationVo extends Evaluation {
    private String userName;
    private String nickName;
    private String courseName;
}

package com.eduflex.manage.evaluation.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.evaluation.domain.Evaluation;
import lombok.Data;

/**
 * 课程评价管理视图对象
 * @author 林煜鋒
 */
@Data
public class EvaluationVo extends Evaluation {
    @Excel(name = "课程名称", sort = 1)
    private String courseName;
    @Excel(name = "用户名称", sort = 2)
    private String userName;
    @Excel(name = "用户昵称", sort = 3)
    private String nickName;
}

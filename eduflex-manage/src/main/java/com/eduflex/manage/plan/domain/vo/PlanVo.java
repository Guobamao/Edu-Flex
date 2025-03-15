package com.eduflex.manage.plan.domain.vo;

import com.eduflex.manage.plan.domain.Plan;
import lombok.Data;

/**
 * 学习计划视图对象
 * @author 林煜鋒
 */
@Data
public class PlanVo extends Plan {
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 目标名称
     */
    private String goalName;
}

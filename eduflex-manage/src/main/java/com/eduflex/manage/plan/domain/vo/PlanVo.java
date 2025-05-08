package com.eduflex.manage.plan.domain.vo;

import com.eduflex.common.annotation.Excel;
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
    @Excel(name = "用户昵称", sort = 2)
    private String nickName;
    /**
     * 用户名
     */
    @Excel(name = "用户名称", sort = 1)
    private String userName;
    /**
     * 目标名称
     */
    @Excel(name = "目标名称", sort = 3)
    private String goalName;
}

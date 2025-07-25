package com.eduflex.manage.goal.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.goal.domain.Goal;
import lombok.Data;

/**
 * 管理端 - 目标管理视图对象
 *
 * @author 林煜鋒
 */
@Data
public class GoalVo extends Goal {

    @Excel(name = "用户名称", sort = 1)
    private String userName;
    @Excel(name = "用户昵称", sort = 2)
    private String nickName;
}

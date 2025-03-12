package com.eduflex.manage.goal.domain.vo;

import com.eduflex.manage.goal.domain.Goal;
import lombok.Data;

/**
 * 管理端 - 目标管理视图对象
 * @author 林煜鋒
 */
@Data
public class GoalVo extends Goal {
    private String userName;
    private String nickName;
}

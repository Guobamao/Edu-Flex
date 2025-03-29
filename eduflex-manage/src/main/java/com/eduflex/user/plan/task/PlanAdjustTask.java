package com.eduflex.user.plan.task;

import com.eduflex.manage.plan.service.IPlanService;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 学习计划调整任务
 * @author 林煜鋒
 */
@Component("planAdjustTask")
public class PlanAdjustTask {

    private static final Logger log = LoggerFactory.getLogger(PlanAdjustTask.class);
    @Autowired
    private IPlanService planService;

    public void adjustPlan() throws SchedulerException {
        log.info("+++++++定时任务：学习计划调整任务");
        planService.adjustPlan();
    }
}

package com.eduflex.user.homework.task;

import com.eduflex.manage.exam.service.IExamRecordService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 强制收卷定时任务
 */
@Component("breakExamTask")
@Slf4j
public class BreakExamTask {

    @Autowired
    private IExamRecordService examRecordService;

    public void ryParams(Long recordId) throws SchedulerException {
        log.info("++++++++++定时任务：处理到期的交卷");
        log.info("++++++++++记录参数：{}", recordId);

        // 强制交卷
        examRecordService.handExam(recordId);
    }
}

package com.eduflex.quartz.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.ScheduleConstants;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.quartz.domain.SysJob;
import com.eduflex.quartz.mapper.SysJobMapper;
import com.eduflex.quartz.service.ISysJobService;
import com.eduflex.quartz.util.CronUtils;
import com.eduflex.quartz.util.ScheduleUtils;
import org.quartz.JobDataMap;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * 定时任务调度信息 服务层
 *
 * @author ruoyi
 */
@Service
public class SysJobServiceImpl extends ServiceImpl<SysJobMapper, SysJob> implements ISysJobService {

    @Autowired
    private Scheduler scheduler;

    /**
     * 项目启动时，初始化定时器 主要是防止手动修改数据库导致未同步到定时任务处理（注：不能手动修改数据库ID和任务组名，否则会导致脏数据）
     */
    @PostConstruct
    public void init() throws SchedulerException, TaskException {
        scheduler.clear();
        List<SysJob> jobList = list();
        for (SysJob job : jobList) {
            ScheduleUtils.createScheduleJob(scheduler, job);
        }
    }

    @Override
    public List<SysJob> selectJobList(SysJob job) {
        LambdaQueryWrapper<SysJob> wrapper = Wrappers.<SysJob>lambdaQuery()
                .like(StrUtil.isNotBlank(job.getJobName()), SysJob::getJobName, job.getJobName())
                .eq(job.getJobGroup() != null, SysJob::getJobGroup, job.getJobGroup())
                .eq(job.getStatus() != null, SysJob::getStatus, job.getStatus())
                .like(StrUtil.isNotBlank(job.getInvokeTarget()), SysJob::getInvokeTarget, job.getInvokeTarget());
        return list(wrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int pauseJob(SysJob job) throws SchedulerException {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        job.setStatus(ScheduleConstants.Status.PAUSE.getValue());
        boolean flag = updateById(job);
        if (flag) {
            scheduler.pauseJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
        return flag ? 1 : 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int resumeJob(SysJob job) throws SchedulerException {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        job.setStatus(ScheduleConstants.Status.NORMAL.getValue());
        boolean flag = updateById(job);
        if (flag) {
            scheduler.resumeJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
        return flag ? 1 : 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteJob(SysJob job) throws SchedulerException {
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        boolean flag = removeById(jobId);
        if (flag) {
            scheduler.deleteJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteJobByIds(List<Long> jobIds) throws SchedulerException {
        for (Long jobId : jobIds) {
            SysJob job = getById(jobId);
            deleteJob(job);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int changeStatus(SysJob job) throws SchedulerException {
        int rows = 0;
        String status = job.getStatus();
        if (ScheduleConstants.Status.NORMAL.getValue().equals(status)) {
            rows = resumeJob(job);
        } else if (ScheduleConstants.Status.PAUSE.getValue().equals(status)) {
            rows = pauseJob(job);
        }
        return rows;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean run(SysJob job) throws SchedulerException {
        boolean result = false;
        Long jobId = job.getJobId();
        String jobGroup = job.getJobGroup();
        SysJob properties = getById(job.getJobId());
        // 参数
        JobDataMap dataMap = new JobDataMap();
        dataMap.put(ScheduleConstants.TASK_PROPERTIES, properties);
        JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
        if (scheduler.checkExists(jobKey)) {
            result = true;
            scheduler.triggerJob(jobKey, dataMap);
        }
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertJob(SysJob job) throws SchedulerException, TaskException {
        if (StrUtil.isBlank(job.getStatus())) {
            job.setStatus(ScheduleConstants.Status.PAUSE.getValue());
        }
        boolean flag = save(job);
        if (flag) {
            ScheduleUtils.createScheduleJob(scheduler, job);
        }
        return flag ? 1 : 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateJob(SysJob job) throws SchedulerException, TaskException {
        SysJob properties = getById(job.getJobId());
        boolean flag = updateById(job);
        if (flag) {
            updateSchedulerJob(job, properties.getJobGroup());
        }
        return flag ? 1 : 0;
    }

    public void updateSchedulerJob(SysJob job, String jobGroup) throws SchedulerException, TaskException {
        Long jobId = job.getJobId();
        // 判断是否存在
        JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
        if (scheduler.checkExists(jobKey)) {
            // 防止创建时存在数据问题 先移除，然后在执行创建操作
            scheduler.deleteJob(jobKey);
        }
        ScheduleUtils.createScheduleJob(scheduler, job);
    }

    @Override
    public boolean checkCronExpressionIsValid(String cronExpression) {
        return CronUtils.isValid(cronExpression);
    }
}

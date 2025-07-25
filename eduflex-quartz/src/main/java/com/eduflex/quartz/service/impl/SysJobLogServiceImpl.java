package com.eduflex.quartz.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.quartz.domain.SysJobLog;
import com.eduflex.quartz.mapper.SysJobLogMapper;
import com.eduflex.quartz.service.ISysJobLogService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 定时任务调度日志信息 服务层
 *
 * @author ruoyi
 */
@Service
public class SysJobLogServiceImpl extends ServiceImpl<SysJobLogMapper, SysJobLog> implements ISysJobLogService {

    @Override
    public List<SysJobLog> selectJobLogList(SysJobLog jobLog) {
        LambdaQueryWrapper<SysJobLog> wrapper = Wrappers.<SysJobLog>lambdaQuery()
                .like(StrUtil.isNotBlank(jobLog.getJobName()), SysJobLog::getJobName, jobLog.getJobName())
                .eq(jobLog.getJobGroup() != null, SysJobLog::getJobGroup, jobLog.getJobGroup())
                .eq(jobLog.getStatus() != null, SysJobLog::getStatus, jobLog.getStatus())
                .like(StrUtil.isNotBlank(jobLog.getInvokeTarget()), SysJobLog::getInvokeTarget, jobLog.getInvokeTarget())
                .between(ObjectUtil.isAllNotEmpty(jobLog.getParams().get("beginTime"), jobLog.getParams().get("endTime")),
                        SysJobLog::getCreateTime, jobLog.getParams().get("beginTime"), jobLog.getParams().get("endTime"))
                .orderByDesc(SysJobLog::getCreateTime);
        return list(wrapper);
    }

    @Override
    public void cleanJobLog() {
        baseMapper.cleanJobLog();
    }
}

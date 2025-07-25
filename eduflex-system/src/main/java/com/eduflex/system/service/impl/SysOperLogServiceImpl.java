package com.eduflex.system.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.system.domain.SysOperLog;
import com.eduflex.system.mapper.SysOperLogMapper;
import com.eduflex.system.service.ISysOperLogService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 操作日志 服务层处理
 *
 * @author ruoyi
 */
@Service
public class SysOperLogServiceImpl extends ServiceImpl<SysOperLogMapper, SysOperLog> implements ISysOperLogService {

    /**
     * 查询系统操作日志集合
     *
     * @param operLog 操作日志对象
     * @return 操作日志集合
     */
    @Override
    public List<SysOperLog> selectOperLogList(SysOperLog operLog) {
        LambdaQueryWrapper<SysOperLog> wrapper = Wrappers.<SysOperLog>lambdaQuery()
                .like(StrUtil.isNotBlank(operLog.getOperIp()), SysOperLog::getOperIp, operLog.getOperIp())
                .like(StrUtil.isNotBlank(operLog.getTitle()), SysOperLog::getTitle, operLog.getTitle())
                .eq(operLog.getBusinessType() != null, SysOperLog::getBusinessType, operLog.getBusinessType())
                .in(CollUtil.isNotEmpty(operLog.getBusinessTypes()), SysOperLog::getBusinessType, operLog.getBusinessTypes())
                .eq(operLog.getStatus() != null, SysOperLog::getStatus, operLog.getStatus())
                .like(StrUtil.isNotBlank(operLog.getOperName()), SysOperLog::getOperName, operLog.getOperName())
                .between(ObjectUtil.isAllNotEmpty(operLog.getParams().get("beginTime"), operLog.getParams().get("endTime")),
                        SysOperLog::getOperTime, operLog.getParams().get("beginTime"), operLog.getParams().get("endTime"))
                .orderByDesc(SysOperLog::getOperTime);
        return list(wrapper);
    }

    /**
     * 清空操作日志
     */
    @Override
    public void cleanOperLog() {
        baseMapper.cleanOperLog();
    }
}

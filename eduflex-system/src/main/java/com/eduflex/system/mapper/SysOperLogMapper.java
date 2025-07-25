package com.eduflex.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.system.domain.SysOperLog;

/**
 * 操作日志 数据层
 *
 * @author ruoyi
 */
public interface SysOperLogMapper extends BaseMapper<SysOperLog> {
    /**
     * 清空操作日志
     */
    void cleanOperLog();
}

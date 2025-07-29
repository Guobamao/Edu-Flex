package com.eduflex.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.system.domain.SysOperLog;

import java.util.List;

/**
 * 操作日志 服务层
 *
 * @author ruoyi
 */
public interface ISysOperLogService extends IService<SysOperLog> {

    /**
     * 查询系统操作日志集合
     *
     * @param operLog 操作日志对象
     * @return 操作日志集合
     */
    List<SysOperLog> selectOperLogList(SysOperLog operLog);

    /**
     * 清空操作日志
     */
    void cleanOperLog();
}

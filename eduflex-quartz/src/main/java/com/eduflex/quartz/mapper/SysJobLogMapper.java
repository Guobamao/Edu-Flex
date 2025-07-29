package com.eduflex.quartz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.quartz.domain.SysJobLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * 调度任务日志信息 数据层
 *
 * @author ruoyi
 */
@Mapper
public interface SysJobLogMapper extends BaseMapper<SysJobLog> {

    /**
     * 清空任务日志
     */
    void cleanJobLog();
}

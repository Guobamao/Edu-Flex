package com.eduflex.quartz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.quartz.domain.SysJob;
import org.apache.ibatis.annotations.Mapper;

/**
 * 调度任务信息 数据层
 *
 * @author ruoyi
 */
@Mapper
public interface SysJobMapper extends BaseMapper<SysJob> {
}

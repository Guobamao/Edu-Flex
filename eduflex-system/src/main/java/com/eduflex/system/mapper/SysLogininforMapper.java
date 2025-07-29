package com.eduflex.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.system.domain.SysLogininfor;

/**
 * 系统访问日志情况信息 数据层
 *
 * @author ruoyi
 */
public interface SysLogininforMapper extends BaseMapper<SysLogininfor> {
    /**
     * 清空系统登录日志
     *
     * @return 结果
     */
    int cleanLogininfor();
}

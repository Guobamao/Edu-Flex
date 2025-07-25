package com.eduflex.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.system.domain.SysLogininfor;

import java.util.List;

/**
 * 系统访问日志情况信息 服务层
 *
 * @author ruoyi
 */
public interface ISysLogininforService extends IService<SysLogininfor> {

    /**
     * 查询系统登录日志集合
     *
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    List<SysLogininfor> selectLogininforList(SysLogininfor logininfor);

    /**
     * 清空系统登录日志
     */
    void cleanLogininfor();
}

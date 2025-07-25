package com.eduflex.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.system.domain.SysLogininfor;
import com.eduflex.system.mapper.SysLogininforMapper;
import com.eduflex.system.service.ISysLogininforService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author ruoyi
 */
@Service
public class SysLogininforServiceImpl extends ServiceImpl<SysLogininforMapper, SysLogininfor> implements ISysLogininforService {

    @Override
    public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor) {
        LambdaQueryWrapper<SysLogininfor> wrapper = Wrappers.<SysLogininfor>lambdaQuery()
                .like(StrUtil.isNotBlank(logininfor.getIpaddr()), SysLogininfor::getIpaddr, logininfor.getIpaddr())
                .eq(logininfor.getStatus() != null, SysLogininfor::getStatus, logininfor.getStatus())
                .like(StrUtil.isNotBlank(logininfor.getUserName()), SysLogininfor::getUserName, logininfor.getUserName())
                .between(ObjectUtil.isAllNotEmpty(logininfor.getParams().get("beginTime"), logininfor.getParams().get("endTime")),
                        SysLogininfor::getLoginTime, logininfor.getParams().get("beginTime"), logininfor.getParams().get("endTime"))
                .orderByDesc(SysLogininfor::getLoginTime);
        return list(wrapper);
    }

    /**
     * 清空系统登录日志
     */
    @Override
    public void cleanLogininfor() {
        baseMapper.cleanLogininfor();
    }
}

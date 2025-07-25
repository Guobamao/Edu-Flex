package com.eduflex.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.system.domain.SysNotice;
import com.eduflex.system.mapper.SysNoticeMapper;
import com.eduflex.system.service.ISysNoticeService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 公告 服务层实现
 *
 * @author ruoyi
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper, SysNotice> implements ISysNoticeService {

    @Override
    public List<SysNotice> selectNoticeList(SysNotice notice) {
        LambdaQueryWrapper<SysNotice> wrapper = Wrappers.<SysNotice>lambdaQuery()
                .like(StrUtil.isNotBlank(notice.getNoticeTitle()), SysNotice::getNoticeTitle, notice.getNoticeTitle())
                .eq(notice.getNoticeType() != null, SysNotice::getNoticeType, notice.getNoticeType())
                .like(StrUtil.isNotBlank(notice.getCreateBy()), SysNotice::getCreateBy, notice.getCreateBy());
        return list(wrapper);
    }
}

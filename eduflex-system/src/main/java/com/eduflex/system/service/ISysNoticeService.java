package com.eduflex.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.system.domain.SysNotice;

import java.util.List;

/**
 * 公告 服务层
 *
 * @author ruoyi
 */
public interface ISysNoticeService extends IService<SysNotice> {
    /**
     * 查询公告列表
     *
     * @param notice 公告信息
     * @return 公告集合
     */
    List<SysNotice> selectNoticeList(SysNotice notice);
}

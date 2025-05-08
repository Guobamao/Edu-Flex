package com.eduflex.manage.carousel.service;

import java.util.List;
import com.eduflex.manage.carousel.domain.Carousel;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 轮播图 Service接口
 *
 * @author 林煜鋒
 * @date 2025-05-07
 */
public interface ICarouselService extends IService<Carousel> {
    /**
     * 查询轮播图列表
     *
     * @param carousel 轮播图
     * @return 轮播图集合
     */
    List<Carousel> selectCarouselList(Carousel carousel);

    /**
     * 启用轮播图
     * @param id 轮播图ID
     * @return 结果
     */
    int enableById(Long id);
}

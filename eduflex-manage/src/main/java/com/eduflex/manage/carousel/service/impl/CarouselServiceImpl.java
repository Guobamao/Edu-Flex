package com.eduflex.manage.carousel.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.carousel.domain.Carousel;
import com.eduflex.manage.carousel.mapper.CarouselMapper;
import com.eduflex.manage.carousel.service.ICarouselService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 轮播图Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-05-07
 */
@Service
public class CarouselServiceImpl extends ServiceImpl<CarouselMapper, Carousel> implements ICarouselService {

    @Override
    public List<Carousel> selectCarouselList(Carousel carousel) {
        LambdaQueryWrapper<Carousel> wrapper = new LambdaQueryWrapper<Carousel>()
                .eq(carousel.getEnabled() != null, Carousel::getEnabled, carousel.getEnabled());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public int enableById(Long id) {
        // 查询所有轮播图
        List<Carousel> carouselList = selectCarouselList(new Carousel());
        for (Carousel carousel : carouselList) {
            // 如果当前轮播图的id与要启用的轮播图id相同，则将其状态设置为启用
            if (carousel.getId().equals(id)) {
                carousel.setEnabled(1);
            } else {
                // 如果当前轮播图的id与要启用的轮播图id不相同，则将其状态设置为禁用
                carousel.setEnabled(0);
            }
        }
        return updateBatchById(carouselList) ? 1 : 0;
    }
}

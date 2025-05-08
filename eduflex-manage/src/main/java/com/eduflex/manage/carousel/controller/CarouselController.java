package com.eduflex.manage.carousel.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.manage.carousel.domain.Carousel;
import com.eduflex.manage.carousel.service.ICarouselService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 *
 * @author 林煜鋒
 * @date 2025-05-07
 */
@RestController
@RequestMapping("/manage/carousel")
public class CarouselController extends BaseController
{
    @Autowired
    private ICarouselService carouselService;

    /**
     * 查询轮播图列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(Carousel carousel)
    {
        startPage();
        List<Carousel> list = carouselService.selectCarouselList(carousel);
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Carousel carousel)
    {
        List<Carousel> list = carouselService.selectCarouselList(carousel);
        ExcelUtil<Carousel> util = new ExcelUtil<>(Carousel.class);
        util.exportExcel(response, list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(carouselService.getById(id));
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Carousel carousel)
    {
        carousel.setCreateBy(getUsername());
        return toAjax(carouselService.save(carousel));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Carousel carousel)
    {
        carousel.setUpdateBy(getUsername());
        return toAjax(carouselService.updateById(carousel));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(carouselService.removeByIds(idList));
    }

    /**
     * 启用轮播图
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping("/enable/{id}")
    public AjaxResult enable(@PathVariable Long id) {
        return toAjax(carouselService.enableById(id));
    }
}

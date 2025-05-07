package com.eduflex.user.carousel;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.carousel.domain.Carousel;
import com.eduflex.manage.carousel.service.ICarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "UserCarouselController")
@RequestMapping("/user/carousel")
public class CarouselController extends BaseController {

    @Autowired
    private ICarouselService carouselService;

    @GetMapping("/list")
    public AjaxResult list() {
        Carousel carousel = new Carousel();
        carousel.setEnabled(EduFlexConstants.STATUS_ENABLED);
        return AjaxResult.success(carouselService.selectCarouselList(carousel).get(0));
    }
}

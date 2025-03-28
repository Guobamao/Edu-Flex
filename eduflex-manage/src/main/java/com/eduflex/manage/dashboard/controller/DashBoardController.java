package com.eduflex.manage.dashboard.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.manage.dashboard.service.IDashBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 数据面板 Controller
 * @author 林煜鋒
 */
@RestController
@RequestMapping("/manage/dashboard")
public class DashBoardController extends BaseController {

    @Autowired
    private IDashBoardService dashBoardService;

    @GetMapping("/stats")
    public AjaxResult getStats() {
        return AjaxResult.success(dashBoardService.getStats());
    }

    @GetMapping("/top-courses")
    public AjaxResult getTopCourses() {
        return AjaxResult.success(dashBoardService.getTopCourses());
    }

    @GetMapping("/trend")
    public AjaxResult getTrend() {
        return AjaxResult.success(dashBoardService.getTrend());
    }
}

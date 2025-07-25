package com.eduflex.user.search.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.user.search.service.ISearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user/search")
public class SearchController extends BaseController {

    @Autowired
    private ISearchService searchService;

    /**
     * 获取搜索列表（热搜）
     *
     * @return 搜索列表
     */
    @GetMapping("/list")
    public AjaxResult list() {
        return success(searchService.selectSearchList());
    }
}

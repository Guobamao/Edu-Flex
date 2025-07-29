package com.eduflex.user.search.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.user.search.domain.Search;

import java.util.List;

/**
 * 搜索服务 Service 接口
 */
public interface ISearchService extends IService<Search> {
    /**
     * 查询搜索列表
     *
     * @return 搜索列表
     */
    List<String> selectSearchList();
}

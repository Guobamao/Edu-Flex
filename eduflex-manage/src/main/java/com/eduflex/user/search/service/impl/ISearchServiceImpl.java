package com.eduflex.user.search.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.user.search.domain.Search;
import com.eduflex.user.search.mapper.SearchMapper;
import com.eduflex.user.search.service.ISearchService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ISearchServiceImpl extends ServiceImpl<SearchMapper, Search> implements ISearchService {
    @Override
    public List<String> selectSearchList() {
        LambdaQueryWrapper<Search> wrapper = new LambdaQueryWrapper<Search>()
                .orderByDesc(Search::getSearchNum)
                .last("limit 10");
        List<Search> searchList = baseMapper.selectList(wrapper);


        return searchList.stream().map(Search::getSearchValue).toList();
    }
}

package com.eduflex.generator.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.generator.domain.GenTableColumn;
import com.eduflex.generator.mapper.GenTableColumnMapper;
import com.eduflex.generator.service.IGenTableColumnService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 业务字段 服务层实现
 *
 * @author ruoyi
 */
@Service
public class GenTableColumnServiceImpl extends ServiceImpl<GenTableColumnMapper, GenTableColumn> implements IGenTableColumnService {

    @Override
    public List<GenTableColumn> selectGenTableColumnListByTableId(Long tableId) {
        LambdaQueryWrapper<GenTableColumn> wrapper = Wrappers.<GenTableColumn>lambdaQuery()
                .eq(GenTableColumn::getTableId, tableId)
                .orderByAsc(GenTableColumn::getSort);
        return list(wrapper);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeBatchByTableIds(List<Long> tableIds) {
        if (CollUtil.isNotEmpty(tableIds)) {
            LambdaQueryWrapper<GenTableColumn> wrapper = Wrappers.<GenTableColumn>lambdaQuery()
                    .in(GenTableColumn::getTableId, tableIds);
            List<GenTableColumn> tableColumns = list(wrapper);
            List<Long> columnIdList = tableColumns.stream().map(GenTableColumn::getColumnId).toList();
            removeBatchByIds(columnIdList);
        }
    }

    @Override
    public List<GenTableColumn> selectDbTableColumnsByName(String tableName) {
        return baseMapper.selectDbTableColumnsByName(tableName);
    }
}

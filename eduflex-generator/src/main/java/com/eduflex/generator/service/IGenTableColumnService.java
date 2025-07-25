package com.eduflex.generator.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.generator.domain.GenTableColumn;

import java.util.List;

/**
 * 业务字段 服务层
 *
 * @author ruoyi
 */
public interface IGenTableColumnService extends IService<GenTableColumn> {

    /**
     * 查询业务字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    List<GenTableColumn> selectGenTableColumnListByTableId(Long tableId);

    /**
     * 通过表ID批量删除表字段数据
     * @param tableIds 表ID列表
     */
    void removeBatchByTableIds(List<Long> tableIds);

    /**
     * 根据表名称查询列信息
     * @param tableName 表名称
     * @return 列信息
     */
    List<GenTableColumn> selectDbTableColumnsByName(String tableName);
}

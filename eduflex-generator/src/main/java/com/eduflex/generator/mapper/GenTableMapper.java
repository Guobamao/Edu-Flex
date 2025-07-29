package com.eduflex.generator.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.generator.domain.GenTable;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 业务 数据层
 *
 * @author ruoyi
 */
@Mapper
public interface GenTableMapper extends BaseMapper<GenTable> {

    /**
     * 查询据库列表
     *
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    List<GenTable> selectDbTableList(GenTable genTable);

    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    List<GenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 创建表
     *
     * @param sql 表结构
     * @return 结果
     */
    int createTable(String sql);
}

package com.eduflex.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.common.core.domain.entity.SysDictData;

import java.util.List;

/**
 * 字典 业务层
 *
 * @author ruoyi
 */
public interface ISysDictDataService extends IService<SysDictData> {
    /**
     * 根据条件分页查询字典数据
     *
     * @param dictData 字典数据信息
     * @return 字典数据集合信息
     */
    List<SysDictData> selectDictDataList(SysDictData dictData);

    /**
     * 批量删除字典数据信息
     *
     * @param dictCodes 需要删除的字典数据ID
     */
    void deleteDictDataByIds(List<Long> dictCodes);

    /**
     * 新增保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    int insertDictData(SysDictData dictData);

    /**
     * 修改保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    int updateDictData(SysDictData dictData);

    /**
     * 根据字典类型查询字典数据
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    List<SysDictData> selectDictDataByType(String dictType);

    /**
     * 查询字典数据数量
     *
     * @param dictType 字典类型
     * @return 字典数据数量
     */
    long countDictDataByType(String dictType);

    /**
     * 同步修改字典类型
     * @param oldDictType 旧字典类型
     * @param newDictType 新字典类型
     */
    void updateDictDataType(String oldDictType, String newDictType);
}

package com.eduflex.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.UserConstants;
import com.eduflex.common.core.domain.entity.SysDictData;
import com.eduflex.common.core.domain.entity.SysDictType;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DictUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.system.mapper.SysDictTypeMapper;
import com.eduflex.system.service.ISysDictDataService;
import com.eduflex.system.service.ISysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 字典 业务层处理
 *
 * @author ruoyi
 */
@Service
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements ISysDictTypeService {

    @Autowired
    private ISysDictDataService dictDataService;

    /**
     * 项目启动时，初始化字典到缓存
     */
    @PostConstruct
    public void init() {
        loadingDictCache();
    }

    @Override
    public List<SysDictType> selectDictTypeList(SysDictType dictType) {
        LambdaQueryWrapper<SysDictType> wrapper = Wrappers.<SysDictType>lambdaQuery()
                .like(StrUtil.isNotBlank(dictType.getDictName()), SysDictType::getDictName, dictType.getDictName())
                .eq(dictType.getStatus() != null, SysDictType::getStatus, dictType.getStatus())
                .like(StrUtil.isNotBlank(dictType.getDictType()), SysDictType::getDictType, dictType.getDictType())
                .between(ObjectUtil.isAllNotEmpty(dictType.getParams().get("beginTime"), dictType.getParams().get("endTime")),
                        SysDictType::getCreateTime, dictType.getParams().get("beginTime"), dictType.getParams().get("endTime"));
        return list(wrapper);
    }

    @Override
    public void deleteDictTypeByIds(List<Long> dictIds) {
        for (Long dictId : dictIds) {
            SysDictType dictType = getById(dictId);
            if (dictDataService.countDictDataByType(dictType.getDictType()) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            }
            removeById(dictId);
            DictUtils.removeDictCache(dictType.getDictType());
        }
    }

    @Override
    public void loadingDictCache() {
        SysDictData dictData = new SysDictData();
        dictData.setStatus("0");
        Map<String, List<SysDictData>> dictDataMap = dictDataService.selectDictDataList(dictData).stream().collect(Collectors.groupingBy(SysDictData::getDictType));
        for (Map.Entry<String, List<SysDictData>> entry : dictDataMap.entrySet()) {
            DictUtils.setDictCache(entry.getKey(), entry.getValue().stream().sorted(Comparator.comparing(SysDictData::getDictSort)).collect(Collectors.toList()));
        }
    }

    @Override
    public void clearDictCache() {
        DictUtils.clearDictCache();
    }

    @Override
    public void resetDictCache() {
        clearDictCache();
        loadingDictCache();
    }

    @Override
    public int insertDictType(SysDictType dict) {
        int row = baseMapper.insert(dict);
        if (row > 0) {
            DictUtils.setDictCache(dict.getDictType(), null);
        }
        return row;
    }

    @Override
    @Transactional
    public int updateDictType(SysDictType dict) {
        SysDictType oldDict = getById(dict.getDictId());
        dictDataService.updateDictDataType(oldDict.getDictType(), dict.getDictType());
        int row = baseMapper.updateById(dict);
        if (row > 0) {
            List<SysDictData> dictDatas = dictDataService.selectDictDataByType(dict.getDictType());
            DictUtils.setDictCache(dict.getDictType(), dictDatas);
        }
        return row;
    }

    @Override
    public boolean checkDictTypeUnique(SysDictType dict) {
        long dictId = StringUtils.isNull(dict.getDictId()) ? -1L : dict.getDictId();
        SysDictType dictType = getOne(Wrappers.<SysDictType>lambdaQuery()
                .eq(SysDictType::getDictType, dict.getDictType())
                .last("limit 1"));
        if (StringUtils.isNotNull(dictType) && dictType.getDictId() != dictId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}

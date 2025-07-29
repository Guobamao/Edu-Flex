package com.eduflex.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.CacheConstants;
import com.eduflex.common.constant.UserConstants;
import com.eduflex.common.core.redis.RedisCache;
import com.eduflex.common.core.text.Convert;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.system.domain.SysConfig;
import com.eduflex.system.mapper.SysConfigMapper;
import com.eduflex.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Collection;
import java.util.List;

/**
 * 参数配置 服务层实现
 *
 * @author ruoyi
 */
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements ISysConfigService {

    @Autowired
    private RedisCache redisCache;

    /**
     * 项目启动时，初始化参数到缓存
     */
    @PostConstruct
    public void init() {
        loadingConfigCache();
    }

    @Override
    public String selectConfigByKey(String configKey) {
        String configValue = Convert.toStr(redisCache.getCacheObject(getCacheKey(configKey)));
        if (StringUtils.isNotEmpty(configValue)) {
            return configValue;
        }
        LambdaQueryWrapper<SysConfig> wrapper = Wrappers.<SysConfig>lambdaQuery()
                .eq(SysConfig::getConfigKey, configKey);
        SysConfig retConfig = getOne(wrapper);
        if (StringUtils.isNotNull(retConfig)) {
            redisCache.setCacheObject(getCacheKey(configKey), retConfig.getConfigValue());
            return retConfig.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    @Override
    public boolean selectCaptchaEnabled() {
        String captchaEnabled = selectConfigByKey("sys.account.captchaEnabled");
        if (StringUtils.isEmpty(captchaEnabled)) {
            return true;
        }
        return Convert.toBool(captchaEnabled);
    }

    @Override
    public List<SysConfig> selectConfigList(SysConfig config) {
        LambdaQueryWrapper<SysConfig> wrapper = Wrappers.<SysConfig>lambdaQuery()
                .like(StrUtil.isNotBlank(config.getConfigName()), SysConfig::getConfigName, config.getConfigName())
                .eq(config.getConfigType() != null, SysConfig::getConfigType, config.getConfigType())
                .like(StrUtil.isNotBlank(config.getConfigKey()), SysConfig::getConfigKey, config.getConfigKey())
                .between(ObjectUtil.isAllNotEmpty(config.getParams().get("beginTime"), config.getParams().get("endTime")),
                        SysConfig::getCreateTime, config.getParams().get("beginTime"), config.getParams().get("endTime"));
        return list(wrapper);
    }

    @Override
    public int insertConfig(SysConfig config) {
        int row = baseMapper.insert(config);
        if (row > 0) {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return row;
    }

    @Override
    public int updateConfig(SysConfig config) {
        SysConfig temp = getById(config.getConfigId());
        if (!StringUtils.equals(temp.getConfigKey(), config.getConfigKey())) {
            redisCache.deleteObject(getCacheKey(temp.getConfigKey()));
        }

        int row = baseMapper.updateById(config);
        if (row > 0) {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return row;
    }

    @Override
    public void deleteConfigByIds(List<Long> configIds) {
        for (Long configId : configIds) {
            SysConfig config = getById(configId);
            if (StringUtils.equals(UserConstants.YES, config.getConfigType())) {
                throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
            baseMapper.deleteById(configId);
            redisCache.deleteObject(getCacheKey(config.getConfigKey()));
        }
    }

    @Override
    public void loadingConfigCache() {
        List<SysConfig> configsList = list();
        for (SysConfig config : configsList) {
            redisCache.setCacheObject(getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
    }

    @Override
    public void clearConfigCache() {
        Collection<String> keys = redisCache.keys(CacheConstants.SYS_CONFIG_KEY + "*");
        redisCache.deleteObject(keys);
    }

    @Override
    public void resetConfigCache() {
        clearConfigCache();
        loadingConfigCache();
    }

    @Override
    public boolean checkConfigKeyUnique(SysConfig config) {
        Long configId = StringUtils.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        LambdaQueryWrapper<SysConfig> wrapper = Wrappers.<SysConfig>lambdaQuery()
                .eq(SysConfig::getConfigKey, config.getConfigKey())
                .last(" limit 1");
        SysConfig info = getOne(wrapper);
        if (StringUtils.isNotNull(info) && info.getConfigId().longValue() != configId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 设置cache key
     *
     * @param configKey 参数键
     * @return 缓存键key
     */
    private String getCacheKey(String configKey) {
        return CacheConstants.SYS_CONFIG_KEY + configKey;
    }
}

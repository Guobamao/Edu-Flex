package com.eduflex.web.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.eduflex.web.domain.OssFile;
import com.eduflex.web.mapper.OssFileMapper;
import com.eduflex.web.service.OssFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 文件管理表 服务实现类
 * </p>
 *
 * @author Lin Yufeng
 * @since 2025-01-03
 */
@Service
public class OssFileServiceImpl extends ServiceImpl<OssFileMapper, OssFile> implements OssFileService {

    @Override
    public List<OssFile> selectOssFileList(OssFile ossFile) {
        LambdaQueryWrapper<OssFile> wrapper = new LambdaQueryWrapper<OssFile>()
                .like(StrUtil.isNotBlank(ossFile.getName()), OssFile::getOriginName, ossFile.getName())
                .eq(ossFile.getFileType() != null, OssFile::getFileType, ossFile.getFileType());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public int updateOssFile(OssFile ossFile) {
        LambdaUpdateWrapper<OssFile> wrapper = new LambdaUpdateWrapper<OssFile>()
                .set(ossFile.getFileType() != null, OssFile::getFileType, ossFile.getFileType())
                .eq(OssFile::getId, ossFile.getId());
        return baseMapper.update(ossFile, wrapper);
    }
}

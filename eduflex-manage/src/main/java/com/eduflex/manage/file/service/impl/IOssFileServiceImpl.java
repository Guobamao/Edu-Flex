package com.eduflex.manage.file.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.manage.course_material.service.ICourseMaterialService;
import com.eduflex.manage.file.domain.OssFile;
import com.eduflex.manage.file.mapper.OssFileMapper;
import com.eduflex.manage.file.service.IOssFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class IOssFileServiceImpl extends ServiceImpl<OssFileMapper, OssFile> implements IOssFileService {

    @Autowired
    private ICourseMaterialService courseMaterialService;

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

    @Override
    @Transactional
    public boolean removeWithMaterialByIds(List<Long> idList) {
        for (Long id : idList) {
            if (courseMaterialService.getByFileId(id) > 0) {
                courseMaterialService.removeByFileId(id);
            }
        }
        return removeByIds(idList);
    }
}

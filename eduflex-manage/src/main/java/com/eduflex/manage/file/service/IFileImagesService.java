package com.eduflex.manage.file.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.file.domain.FileImages;

import java.util.List;

/**
 * 文件管理表 服务类
 *
 * @author 林煜鋒
 * @since 2025-01-24
 */
public interface IFileImagesService extends IService<FileImages> {

    /**
     * 根据文件id查询图片
     *
     * @param id 文件id
     * @return 图片列表
     */
    List<FileImages> getByFileId(Long id);

    /**
     * 生成图片
     *
     * @param fileId 文件ID
     */
    void generateFileImages(Long fileId);
}

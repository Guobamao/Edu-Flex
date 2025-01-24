package com.eduflex.web.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.web.domain.FileImages;

import java.util.List;

/**
 * 文件管理表 服务类
 *
 * @author 林煜鋒
 * @since 2025-01-24
 */
public interface FileImagesService extends IService<FileImages> {

    /**
     * 根据文件id查询图片
     *
     * @param id 文件id
     * @return
     */
    List<FileImages> getByFileId(Long id);
}

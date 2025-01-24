package com.eduflex.web.service;

import com.eduflex.web.domain.OssFile;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 文件管理表 服务类
 *
 * @author 林煜鋒
 * @since 2025-01-03
 */
public interface OssFileService extends IService<OssFile> {

    /**
     * 查询资源管理列表
     *
     * @param ossFile 资源管理
     * @return 资源管理集合
     */
    List<OssFile> selectOssFileList(OssFile ossFile);

    /**
     * 修改资源信息
     * @param ossFile 资源
     * @return 结果
     */
    int updateOssFile(OssFile ossFile);

    /**
     * 批量删除资源信息（包括课程资料）
     *
     * @param idList 资源id集合
     * @return 结果
     */
    boolean removeWithMaterialByIds(List<Long> idList);
}

package com.eduflex.manage.file.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.converter.PDFConverter;
import com.eduflex.manage.file.domain.FileImages;
import com.eduflex.manage.file.domain.OssFile;
import com.eduflex.manage.file.mapper.FileImagesMapper;
import com.eduflex.manage.file.service.IFileImagesService;
import com.eduflex.manage.file.service.IOssFileService;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 文件管理表 服务实现类
 * </p>
 *
 * @author Lin Yufeng
 * @since 2025-01-24
 */
@Service
public class IFileImagesServiceImpl extends ServiceImpl<FileImagesMapper, FileImages> implements IFileImagesService {

    @Autowired
    private IOssFileService ossFileService;

    @Autowired
    private FileStorageService fileStorageService;

    @Override
    public List<FileImages> getByFileId(Long id) {
        LambdaQueryWrapper<FileImages> wrapper = new LambdaQueryWrapper<FileImages>()
                .eq(FileImages::getFileId, id);

        // 如果有数据，则返回数据
        if (this.count(wrapper) == 0) {
            generateFileImages(id);
        }
        wrapper.orderByAsc(FileImages::getPageNumber);
        return baseMapper.selectList(wrapper);
    }

    @Override
    @Async
    public void generateFileImages(Long fileId) {
        // 如果没有数据，则转换后存储。
        OssFile ossFile = ossFileService.getById(fileId);
        List<byte[]> bytes = null;
        ByteArrayOutputStream byteArrayOutputStream = null;
        List<FileImages> fileImagesList = new ArrayList<>();

        if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_TEXT)) {
            if ("doc".equalsIgnoreCase(ossFile.getSuffix()) || "docx".equalsIgnoreCase(ossFile.getSuffix())) {
                byteArrayOutputStream = PDFConverter.convertWordToPDF("D:\\Temp\\" + ossFile.getPath());
            } else if ("xlsx".equalsIgnoreCase(ossFile.getSuffix()) || "xls".equalsIgnoreCase(ossFile.getSuffix()) || "csv".equalsIgnoreCase(ossFile.getSuffix())) {
                byteArrayOutputStream = PDFConverter.convertExcelToPDF("D:\\Temp\\" + ossFile.getPath());
            } else {
                byteArrayOutputStream = PDFConverter.convertTxtToPDF("D:\\Temp\\" + ossFile.getPath());
            }
        } else if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_PDF)) {
            bytes = PDFConverter.convertPDFToImages("D:\\Temp\\" + ossFile.getPath());
        } else if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_PPT)) {
            byteArrayOutputStream = PDFConverter.convertPPTToPDF("D:\\Temp\\" + ossFile.getPath());
        }
        if (byteArrayOutputStream != null) {
            bytes = PDFConverter.convertPDFToImages(byteArrayOutputStream);
        }
        if (bytes != null) {
            for (int i = 0; i < bytes.size(); i++) {
                byte[] imageBytes = bytes.get(i);
                FileInfo info = fileStorageService.of(imageBytes).setPath(ossFile.getId() + "/").upload();
                FileImages fileImages = new FileImages();
                fileImages.setFileId(ossFile.getId());
                fileImages.setPath(info.getBasePath() + ossFile.getId() + "/" + info.getFilename());
                fileImages.setPageNumber(i + 1);
                fileImagesList.add(fileImages);
            }
        }
        baseMapper.insert(fileImagesList);
    }
}

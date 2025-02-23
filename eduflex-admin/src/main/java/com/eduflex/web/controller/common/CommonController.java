package com.eduflex.web.controller.common;

import com.eduflex.common.config.RuoYiConfig;
import com.eduflex.common.constant.Constants;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.common.utils.file.FileUtils;
import com.eduflex.manage.file.domain.OssFile;
import com.eduflex.manage.file.service.IFileImagesService;
import com.eduflex.manage.file.service.IOssFileService;
import com.eduflex.web.utils.MediaUtil;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 通用请求处理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/common")
public class CommonController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private IOssFileService ossFileService;
    
    @Autowired
    private IFileImagesService fileImagesService;

    private static final String FILE_DELIMETER = ",";

    /**
     * 通用下载请求
     *
     * @param fileName 文件名称
     * @param delete   是否删除
     */
    @GetMapping("/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request) {
        try {
            if (!FileUtils.checkAllowDownload(fileName)) {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = RuoYiConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete) {
                FileUtils.deleteFile(filePath);
            }
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }

    @PostMapping("/download/{id}")
    public void download(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        OssFile ossFile = ossFileService.getById(id);
        String path = "D:\\Temp\\" + ossFile.getPath();
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        FileUtils.setAttachmentResponseHeader(response, ossFile.getOriginName());
        FileUtils.writeBytes(path, response.getOutputStream());
    }

    /**
     * 通用图片预览请求
     * @param id 文件ID
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @throws IOException
     */
    @GetMapping("/preview/{id}")
    public void preview(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        OssFile ossFile = ossFileService.getById(id);
        OutputStream os = null;
        String path = "D:\\Temp\\" + ossFile.getPath();
        try {
            response.setContentType(ossFile.getType());
            os = response.getOutputStream();
            if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_IMAGE)) {
                BufferedImage image = ImageIO.read(new FileInputStream(path));

                if (image != null) {
                    ImageIO.write(image, ossFile.getSuffix(), os);
                }
            }
        } catch (IOException e) {
            log.error("预览文件失败", e);
        } finally {
            if (os != null) {
                os.flush();
                os.close();
            }
        }
    }

    @GetMapping("/previewVideo/{id}")
    public void previewVideo(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        OssFile ossFile = ossFileService.getById(id);
        String path = "D:\\Temp\\" + ossFile.getPath();
        try {
//            response.setContentType(ossFile.getType());
//            os = response.getOutputStream();
            FileInputStream fileInputStream = new FileInputStream(path);
            byte[] buffer = new byte[1024];
            int len;
            while((len = fileInputStream.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, len);
            }
            fileInputStream.close();
            response.getOutputStream().flush();
            response.getOutputStream().close();

        } catch (IOException e) {
            log.error("预览文件失败", e);
        }
    }

    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) {
        try {
            FileInfo info = fileStorageService.of(file).upload();

            OssFile ossFile = new OssFile();
            ossFile.setName(info.getFilename());
            ossFile.setSuffix(info.getExt());
            ossFile.setSize(info.getSize());
            ossFile.setType(info.getContentType());
            ossFile.setPath(info.getBasePath() + info.getFilename());
            ossFile.setOriginName(info.getOriginalFilename());
            ossFile.setCreateBy(getUsername());

            if (EduFlexConstants.FILE_TYPE_TEXT_LIST.contains(info.getContentType())) {
                // 纯文本类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_TEXT);
            } else if (EduFlexConstants.FILE_TYPE_IMAGE_LIST.contains(info.getContentType())) {
                // 图片类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_IMAGE);
            } else if (EduFlexConstants.FILE_TYPE_VIDEO_LIST.contains(info.getContentType())) {
                // 音视频类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO);
                ossFile.setDuration(MediaUtil.getMediaDuration("D:\\Temp\\" + ossFile.getPath()));
            } else if (EduFlexConstants.FILE_TYPE_AUDIO_LIST.contains(info.getContentType())) {
                // 音视频类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO);
                ossFile.setDuration(MediaUtil.getMediaDuration("D:\\Temp\\" + ossFile.getPath()));
            } else if (EduFlexConstants.FILE_TYPE_PPT_LIST.contains(info.getContentType())) {
                // PPT 类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_PPT);
            } else if (EduFlexConstants.FILE_tYPE_PDF_LIST.contains(info.getContentType())) {
                // PDF 类型
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_PDF);
            } else {
                ossFile.setFileType(EduFlexConstants.FILE_TYPE_OTHER);
            }

            ossFileService.save(ossFile);

            if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_TEXT) ||
                    ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_PPT) ||
                    ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_PDF)) {
                fileImagesService.generateFileImages(ossFile.getId());
            }
            AjaxResult ajax = AjaxResult.success();
            ajax.put("fileId", ossFile.getId());
            ajax.put("fileName", ossFile.getOriginName());
            ajax.put("type", ossFile.getFileType());

            if (ossFile.getFileType().equals(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO)) {
                ajax.put("duration", ossFile.getDuration());
            }
            return ajax;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 通用上传请求（多个）
     */
    @PostMapping("/uploads")
    public AjaxResult uploadFiles(List<MultipartFile> files) {
        try {

            List<OssFile> ossFileList = new ArrayList<>();
            for (MultipartFile file : files) {
                FileInfo info = fileStorageService.of(file).upload();
                OssFile ossFile = new OssFile();
                ossFile.setName(info.getFilename());
                ossFile.setSuffix(info.getExt());
                ossFile.setSize(info.getSize());
                ossFile.setType(info.getContentType());
                ossFile.setPath(info.getBasePath() + info.getFilename());
                ossFile.setOriginName(info.getOriginalFilename());
                ossFile.setCreateBy(getUsername());

                if (EduFlexConstants.FILE_TYPE_TEXT_LIST.contains(info.getContentType())) {
                    // 纯文本类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_TEXT);
                } else if (EduFlexConstants.FILE_TYPE_IMAGE_LIST.contains(info.getContentType())) {
                    // 图片类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_IMAGE);
                } else if (EduFlexConstants.FILE_TYPE_VIDEO_LIST.contains(info.getContentType())) {
                    // 音视频类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO);
                } else if (EduFlexConstants.FILE_TYPE_AUDIO_LIST.contains(info.getContentType())) {
                    // 音视频类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_VIDEO_AUDIO);
                } else if (EduFlexConstants.FILE_TYPE_PPT_LIST.contains(info.getContentType())) {
                    // PPT 类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_PPT);
                } else if (EduFlexConstants.FILE_tYPE_PDF_LIST.contains(info.getContentType())) {
                    // PDF 类型
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_PDF);
                } else {
                    ossFile.setFileType(EduFlexConstants.FILE_TYPE_OTHER);
                }

                ossFileList.add(ossFile);
            }

            ossFileService.saveBatch(ossFileList);
            AjaxResult ajax = AjaxResult.success();

            List<Long> fileIdList = ossFileList.stream().map(OssFile::getId).toList();
            List<String> fileNameList = ossFileList.stream().map(OssFile::getOriginName).toList();
            List<Integer> typeList = ossFileList.stream().map(OssFile::getFileType).toList();
            ajax.put("fileIds", StringUtils.join(fileIdList, FILE_DELIMETER));
            ajax.put("fileNames", StringUtils.join(fileNameList, FILE_DELIMETER));
            ajax.put("types", StringUtils.join(typeList, FILE_DELIMETER));
            return ajax;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("/download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            if (!FileUtils.checkAllowDownload(resource)) {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            // 下载名称
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }
}

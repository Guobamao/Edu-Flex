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
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
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
    private static final String FILE_DELIMETER = ",";

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private IOssFileService ossFileService;

    @Autowired
    private IFileImagesService fileImagesService;

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
     *
     * @param id       文件ID
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
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

    @GetMapping("/downloadVideo/{id}")
    public void downloadVideo(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        OssFile ossFile = ossFileService.getById(id);
        String path = "D:\\Temp\\" + ossFile.getPath();
        try {
            File file = new File(path);
            //创建一个文件输入流，用于读取文件内容
            FileInputStream fis = new FileInputStream(file);

            //设置响应头，指示浏览器以附件形式下载文件，并设置下载文件名为‘fileName’
            response.setHeader("content-disposition", "attachment;filename=" + ossFile.getName());

            //获取响应的输出流，用于将文件内容写入响应体。
            ServletOutputStream sos = response.getOutputStream();

            //创建一个8KB的缓冲区，用于读取文件内容。
            byte[] buffer = new byte[1024 * 8];
            int len = 0;
            //循环读取文件内容到缓冲区，直到文件读取完。
            while ((len = fis.read(buffer)) != -1) {
                sos.write(buffer, 0, len);
            }
            //关闭文件输入流，释放资源。
            fis.close();
        } catch (IOException e) {
            log.error("预览视频失败", e);
        }
    }

    @GetMapping("/previewVideo/{id}")
    public void previewVideo(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        OssFile ossFile = ossFileService.getById(id);
        String path = "D:\\Temp\\" + ossFile.getPath();
        try {
            File file = new File(path);
            String range = request.getHeader("Range");
            long lenStart = 0;
            if (range != null && range.length() > 7) {
                range = range.substring(6, range.length() - 1);
                lenStart = Long.parseLong(range);
            }
            int size = 1048576;
            response.setHeader("Content-Range", "bytes " + lenStart + "-" + ((file.length() - lenStart - 2 < size) ? file.length() - 1 : lenStart + size - 1) + "/" + file.length());
            response.setHeader("Content-Type", ossFile.getType());
            response.setStatus(HttpStatus.PARTIAL_CONTENT.value());//响应码206表示响应内容为部分数据，需要多次请求
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            randomAccessFile.seek(lenStart);//设置读取的开始字节数
            //视频每次返回一兆数据
            byte[] buffer = new byte[size];
            int len = randomAccessFile.read(buffer);
            if (len != -1) {
                response.getOutputStream().write(buffer, 0, len);
            }
            randomAccessFile.close();
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

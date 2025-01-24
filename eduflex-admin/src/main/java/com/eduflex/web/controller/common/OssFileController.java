package com.eduflex.web.controller.common;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.web.domain.FileImages;
import com.eduflex.web.domain.OssFile;
import com.eduflex.web.service.FileImagesService;
import com.eduflex.web.service.OssFileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * 资源管理 Controller
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/manage/files")
public class OssFileController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(OssFileController.class);
    @Autowired
    private OssFileService ossFileService;

    @Autowired
    private FileImagesService fileImagesService;

    /**
     * 查询资源管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin')")
    @GetMapping("/list")
    public TableDataInfo list(OssFile ossFile) {
        startPage();
        List<OssFile> list = ossFileService.selectOssFileList(ossFile);
        return getDataTable(list);
    }

    /**
     * 导出资源列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin')")
    @Log(title = "资源管理", businessType = com.eduflex.common.enums.BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OssFile ossFile) {
        List<OssFile> list = ossFileService.selectOssFileList(ossFile);
        ExcelUtil<OssFile> util = new ExcelUtil<>(OssFile.class);
        util.exportExcel(response, list, "资源管理数据");
    }

    /**
     * 获取资源详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(ossFileService.getById(id));
    }

    /**
     * 修改资源信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin')")
    @Log(title = "资源管理", businessType = com.eduflex.common.enums.BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OssFile ossFile) {
        ossFile.setUpdateBy(getUsername());
        ossFile.setUpdateTime(DateUtils.getNowDate());
        return toAjax(ossFileService.updateOssFile(ossFile));
    }

    /**
     * 删除资源信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin')")
    @Log(title = "资源管理", businessType = com.eduflex.common.enums.BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(ossFileService.removeWithMaterialByIds(idList));
    }

    @GetMapping("/preview/{id}")
    public AjaxResult preview(@PathVariable Long id) {
        return success(fileImagesService.getByFileId(id));
    }

    @GetMapping("/previewFile/{id}")
    public void previewFile(@PathVariable Long id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        FileImages fileImages = fileImagesService.getById(id);
        OutputStream os = null;
        String path = "D:\\Temp\\" + fileImages.getPath();
        try {
            response.setContentType("image/png");
            os = response.getOutputStream();
            BufferedImage image = ImageIO.read(new FileInputStream(path));
            if (image != null) {
                ImageIO.write(image, "png", os);
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

}

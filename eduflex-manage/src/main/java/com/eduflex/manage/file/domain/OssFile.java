package com.eduflex.manage.file.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 文件管理表
 * </p>
 *
 * @author Lin Yufeng
 * @since 2025-01-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("tb_oss_file")
@ApiModel(value = "OssFile对象", description = "文件管理表")
public class OssFile extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "文件名")
    @Excel(name = "文件名", sort = 1)
    private String name;

    @ApiModelProperty(value = "文件后缀名")
    @Excel(name = "文件后缀名", sort = 2)
    private String suffix;

    @ApiModelProperty(value = "文件路径")
    @Excel(name = "文件路径", sort = 3)
    private String path;

    @ApiModelProperty(value = "文件类型")
    @Excel(name = "文件类型", sort = 4)
    private String type;

    @ApiModelProperty(value = "文件大小")
    @Excel(name = "文件大小", sort = 5)
    private Long size;

    @ApiModelProperty(value = "源文件名称")
    @Excel(name = "源文件名称", sort = 6)
    private String originName;

    @ApiModelProperty(value = "文件类型")
    @Excel(name = "文件类型", sort = 7, dictType = "material_type", comboReadDict = true)
    private Integer fileType;

    /**
     * 音视频时长
     */
    @Excel(name = "音视频时长", sort = 8, suffix = "秒")
    private Integer duration;


}

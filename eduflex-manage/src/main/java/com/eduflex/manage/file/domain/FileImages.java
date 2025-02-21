package com.eduflex.manage.file.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
@TableName("tb_file_images")
@ApiModel(value = "FileImages", description = "文件管理表")
public class FileImages {

    @ApiModelProperty(value = "ID")
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "关联文件ID")
    private Long fileId;

    @ApiModelProperty(value = "图片路径")
    private String path;

    @ApiModelProperty(value = "图片所处页面")
    private Integer pageNumber;
}

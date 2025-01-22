package com.eduflex.web.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import com.eduflex.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.factory.annotation.Autowired;

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
@ApiModel(value="OssFile对象", description="文件管理表")
public class OssFile extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "文件名")
    private String name;

    @ApiModelProperty(value = "文件后缀名")
    private String suffix;

    @ApiModelProperty(value = "文件路径")
    private String path;

    @ApiModelProperty(value = "文件类型")
    private String type;

    @ApiModelProperty(value = "文件大小")
    private Long size;

    @ApiModelProperty(value = "源文件名称")
    private String originName;

    @Autowired
    private Integer fileType;

}

package com.eduflex.manage.file.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
@TableName("tb_file_images")
public class FileImages {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    private Long fileId;

    private String path;

    private Integer pageNumber;
}

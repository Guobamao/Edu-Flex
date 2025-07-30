package com.eduflex.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.annotation.Excel.ColumnType;
import com.eduflex.common.core.domain.BaseEntity;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

/**
 * 岗位表 sys_post
 *
 * @author ruoyi
 */
@Data
@TableName(value = "sys_post")
public class SysPost extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 岗位序号
     */
    @TableId(value = "post_id")
    @Excel(name = "岗位序号", cellType = ColumnType.NUMERIC)
    private Long postId;

    /**
     * 岗位编码
     */
    @Excel(name = "岗位编码")
    private String postCode;

    /**
     * 岗位名称
     */
    @Excel(name = "岗位名称")
    private String postName;

    /**
     * 岗位排序
     */
    @Excel(name = "岗位排序")
    private Integer postSort;

    /**
     * 状态（0正常 1停用）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    @NotBlank(message = "岗位编码不能为空")
    @Size(min = 0, max = 64, message = "岗位编码长度不能超过64个字符")
    public String getPostCode() {
        return postCode;
    }


    @NotBlank(message = "岗位名称不能为空")
    @Size(min = 0, max = 50, message = "岗位名称长度不能超过50个字符")
    public String getPostName() {
        return postName;
    }

    @NotNull(message = "显示顺序不能为空")
    public Integer getPostSort() {
        return postSort;
    }
}

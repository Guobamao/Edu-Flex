package com.eduflex.manage.course_material.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 课程资料对象 tb_course_material
 *
 * @author 林煜鋒
 * @date 2024-10-14
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_course_material")
public class CourseMaterial extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 关联章节ID
     */
    private Long chapterId;

    /**
     * 资料名称
     */
    @Excel(name = "资料名称")
    private String name;

    /**
     * 链接
     */
    @Excel(name = "链接")
    private Long fileId;

    /**
     * 资料类型 1-纯文本 2-图片 3-音视频 4-幻灯片 5-PDF 6-其他文件
     */
    private Integer materialType;

    /**
     * 音视频时长
     */
    private Integer duration;
}

package com.eduflex.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

/**
 * 课程资料对象 tb_course_material
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public class CourseMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 关联章节ID */
    private Long chapterId;

    /** 资料名称 */
    @Excel(name = "资料名称")
    private String name;

    /** 链接 */
    @Excel(name = "链接")
    private String url;

    /** 资料类型 0视频 1图片 2纯文本 3PPT 4PDF */
    private String materialType;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setChapterId(Long chapterId) 
    {
        this.chapterId = chapterId;
    }

    public Long getChapterId() 
    {
        return chapterId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("chapterId", getChapterId())
            .append("name", getName())
            .append("url", getUrl())
            .toString();
    }
}

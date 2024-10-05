package com.eduflex.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 学院管理对象 tb_college
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public class College extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学院ID */
    private Long id;

    /** 父级学院ID */
    private Long parentId;

    /** 祖级列表 */
    private String ancestors;

    /** 学院名称 */
    @Excel(name = "学院名称")
    private String name;

    /** 父级学院名称 */
    private String parentName;

    /** 子部门 */
    private List<College> children = new ArrayList<College>();

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setAncestors(String ancestors) 
    {
        this.ancestors = ancestors;
    }

    public String getAncestors() 
    {
        return ancestors;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public List<College> getChildren() {
        return children;
    }

    public void setChildren(List<College> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("name", getName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}

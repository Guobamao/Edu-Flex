package com.eduflex.manage.carousel.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 轮播图对象 tb_carousel
 *
 * @author 林煜鋒
 * @date 2025-05-07
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_carousel")
public class Carousel extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 图片ID集合
     */
    @Excel(name = "图片ID集合")
    private String imgIds;

    /**
     * 启用状态(0-禁用 1-启用)
     */
    @Excel(name = "启用状态(0-禁用 1-启用)")
    private Integer enabled;
}

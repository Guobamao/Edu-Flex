package com.eduflex.manage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.CourseCategory;

/**
 * 课程分类Mapper接口
 *
 * @author 林煜鋒
 * @date 2024-12-08
 */
public interface CourseCategoryMapper extends BaseMapper<CourseCategory> {
    /**
     * 判断是否有子节点
     * @param categoryId 分类ID
     * @return 布尔值
     */
    int hasChildByCategoryId(Long categoryId);
}

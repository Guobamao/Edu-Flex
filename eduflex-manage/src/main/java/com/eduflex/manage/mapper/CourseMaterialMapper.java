package com.eduflex.manage.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.CourseMaterial;

/**
 * 课程资料Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface CourseMaterialMapper extends BaseMapper<CourseMaterial>
{
    /**
     * 查询课程资料
     * 
     * @param id 课程资料主键
     * @return 课程资料
     */
    public CourseMaterial selectCourseMaterialById(Long id);

    /**
     * 查询课程资料列表
     * 
     * @param courseMaterial 课程资料
     * @return 课程资料集合
     */
    public List<CourseMaterial> selectCourseMaterialList(CourseMaterial courseMaterial);
}

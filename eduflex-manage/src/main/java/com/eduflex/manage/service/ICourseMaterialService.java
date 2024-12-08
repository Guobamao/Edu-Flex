package com.eduflex.manage.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.CourseMaterial;

/**
 * 课程资料Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface ICourseMaterialService extends IService<CourseMaterial>
{
    /**
     * 查询课程资料列表
     * 
     * @param courseMaterial 课程资料
     * @return 课程资料集合
     */
    public List<CourseMaterial> selectCourseMaterialList(CourseMaterial courseMaterial);

    /**
     * 新增课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    public int insertCourseMaterial(CourseMaterial courseMaterial);


    /**
     * 批量删除课程资料
     * 
     * @param ids 需要删除的课程资料主键集合
     * @return 结果
     */
    public int deleteCourseMaterialByIds(Long[] ids);

}

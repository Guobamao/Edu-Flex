package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.CourseMaterial;

/**
 * 课程资料Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface CourseMaterialMapper 
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

    /**
     * 新增课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    public int insertCourseMaterial(CourseMaterial courseMaterial);

    /**
     * 修改课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    public int updateCourseMaterial(CourseMaterial courseMaterial);

    /**
     * 删除课程资料
     * 
     * @param id 课程资料主键
     * @return 结果
     */
    public int deleteCourseMaterialById(Long id);

    /**
     * 批量删除课程资料
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseMaterialByIds(Long[] ids);
}

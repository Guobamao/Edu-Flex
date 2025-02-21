package com.eduflex.manage.course_material.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.course_material.domain.CourseMaterial;
import com.eduflex.user.course_material.domain.vo.CourseMaterialVo;

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
    List<CourseMaterial> selectCourseMaterialList(CourseMaterial courseMaterial);


    /**
     * 批量删除课程资料
     *
     * @param ids 需要删除的课程资料主键集合
     * @return 结果
     */
    int deleteCourseMaterialByIds(Long[] ids);

    /**
     * 根据文件id查询课程资料
     * @param id 文件id
     * @return 结果
     */
    int getByFileId(Long id);

    /**
     * 根据文件id删除课程资料
     *
     * @param id 文件ID
     */
    void removeByFileId(Long id);

    /**
     * 查看课程资料
     * @param id 课程资料id
     * @return 课程资料信息
     */
    CourseMaterialVo selectById(Long id);
}

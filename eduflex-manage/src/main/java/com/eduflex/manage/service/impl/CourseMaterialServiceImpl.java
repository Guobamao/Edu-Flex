package com.eduflex.manage.service.impl;

import java.util.List;

import com.eduflex.manage.domain.CourseChapter;
import com.eduflex.manage.service.ICourseChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CourseMaterialMapper;
import com.eduflex.manage.domain.CourseMaterial;
import com.eduflex.manage.service.ICourseMaterialService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 课程资料Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
@Service
public class CourseMaterialServiceImpl implements ICourseMaterialService 
{
    @Autowired
    private CourseMaterialMapper courseMaterialMapper;
    @Autowired
    private ICourseChapterService courseChapterService;

    /**
     * 查询课程资料
     * 
     * @param id 课程资料主键
     * @return 课程资料
     */
    @Override
    public CourseMaterial selectCourseMaterialById(Long id)
    {
        return courseMaterialMapper.selectCourseMaterialById(id);
    }

    /**
     * 查询课程资料列表
     * 
     * @param courseMaterial 课程资料
     * @return 课程资料
     */
    @Override
    public List<CourseMaterial> selectCourseMaterialList(CourseMaterial courseMaterial)
    {
        return courseMaterialMapper.selectCourseMaterialList(courseMaterial);
    }

    /**
     * 新增课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    @Transactional
    @Override
    public int insertCourseMaterial(CourseMaterial courseMaterial)
    {
        int result = courseMaterialMapper.insertCourseMaterial(courseMaterial);
        if (result > 0) {
            CourseChapter courseChapter = new CourseChapter();
            courseChapter.setId(courseMaterial.getChapterId());
            courseChapter.setHasChildren(1L);
            courseChapterService.updateCourseChapter(courseChapter);
        }
        return result;
    }

    /**
     * 修改课程资料
     * 
     * @param courseMaterial 课程资料
     * @return 结果
     */
    @Override
    public int updateCourseMaterial(CourseMaterial courseMaterial)
    {
        return courseMaterialMapper.updateCourseMaterial(courseMaterial);
    }

    /**
     * 批量删除课程资料
     * 
     * @param ids 需要删除的课程资料主键
     * @return 结果
     */
    @Override
    public int deleteCourseMaterialByIds(Long[] ids)
    {
        int result = courseMaterialMapper.deleteCourseMaterialByIds(ids);
        if (result > 0) {
            // 查询章节还剩下多少个资料，如果为0，则更新hasChildren为0
            for (Long id : ids) {
                CourseMaterial courseMaterial = courseMaterialMapper.selectCourseMaterialById(id);
                CourseChapter courseChapter = new CourseChapter();
                courseChapter.setId(courseMaterial.getChapterId());
                courseChapter.setHasChildren(courseMaterialMapper.selectCourseMaterialList(courseMaterial).isEmpty() ? 0L : 1L);
                courseChapterService.updateCourseChapter(courseChapter);
            }
        }
        return result;
    }

    /**
     * 删除课程资料信息
     * 
     * @param id 课程资料主键
     * @return 结果
     */
    @Override
    public int deleteCourseMaterialById(Long id)
    {
        return courseMaterialMapper.deleteCourseMaterialById(id);
    }
}

package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.College;
import org.apache.ibatis.annotations.Param;

/**
 * 学院管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface CollegeMapper 
{
    /**
     * 查询学院管理
     * 
     * @param id 学院管理主键
     * @return 学院管理
     */
    public College selectCollegeById(Long id);

    /**
     * 查询学院管理列表
     * 
     * @param college 学院管理
     * @return 学院管理集合
     */
    public List<College> selectCollegeList(College college);

    /**
     * 新增学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    public int insertCollege(College college);

    /**
     * 修改学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    public int updateCollege(College college);

    /**
     * 删除学院管理
     * 
     * @param collegeId 学院管理主键
     * @return 结果
     */
    public int deleteCollegeByCollegeId(Long collegeId);

    /**
     * 检验学院名称唯一性
     * @param collegeName 学院名称
     * @param parentId 父级学院ID
     * @return
     */
    College checkCollegeNameUnique(@Param("collegeName") String collegeName, @Param("parentId") Long parentId);

    /**
     * 检验学院是否有子学院
     * @param collegeId 学院ID
     * @return
     */
    int hasChildByCollegeId(Long collegeId);
}

package com.eduflex.manage.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.College;
import org.apache.ibatis.annotations.Param;

/**
 * 学院管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface CollegeMapper extends BaseMapper<College>
{
    /**
     * 检验学院名称唯一性
     * @param collegeName 学院名称
     * @param parentId 父级学院ID
     * @return 学院信息
     */
    College checkCollegeNameUnique(@Param("collegeName") String collegeName, @Param("parentId") Long parentId);

    /**
     * 检验学院是否有子学院
     * @param collegeId 学院ID
     * @return 是否有子学院
     */
    int hasChildByCollegeId(Long collegeId);
}

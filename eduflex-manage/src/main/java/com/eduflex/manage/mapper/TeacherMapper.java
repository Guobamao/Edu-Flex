package com.eduflex.manage.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.Teacher;
import org.apache.ibatis.annotations.Param;

/**
 * 教师管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface TeacherMapper extends BaseMapper<Teacher>
{
    /**
     * 查询教师管理列表
     * 
     * @param wrapper 教师管理
     * @return 教师管理集合
     */
    List<Teacher> selectTeacherList(@Param("ew") QueryWrapper wrapper);

    /**
     * 根据id查询教师管理
     * @param id 教师ID
     * @return 教师信息
     */
    Teacher seleteTeacherById(Long id);
}

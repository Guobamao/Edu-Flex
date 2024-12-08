package com.eduflex.manage.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.Student;
import com.eduflex.manage.domain.vo.StudentVo;
import org.apache.ibatis.annotations.Param;

/**
 * 学生管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
public interface StudentMapper extends BaseMapper<Student>
{

    /**
     * 根据学生id查询用户id
     * @param ids 学生id集合
     * @return 用户id列表
     */
    Long[] selectUserIdsByStudentIds(Long[] ids);

    /**
     * 分页查询学生列表
     * @param wrapper 查询条件
     * @return 学生列表
     */
    List<Student> selectStudentList(@Param("ew") QueryWrapper<Student> wrapper);

    /**
     * 根据学生ID查询学生信息
     */
    StudentVo selectStudentById(Long id);
}

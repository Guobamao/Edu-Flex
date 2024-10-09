package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.Student;
import com.eduflex.manage.domain.dto.StudentDto;
import com.eduflex.manage.domain.vo.StudentVo;

/**
 * 学生管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
public interface StudentMapper 
{
    /**
     * 查询学生管理
     * 
     * @param id 学生管理主键
     * @return 学生管理
     */
    public StudentVo selectStudentById(Long id);

    /**
     * 查询学生管理列表
     * 
     * @param studentDto 学生管理dto
     * @return 学生管理集合
     */
    public List<Student> selectStudentList(StudentDto studentDto);

    /**
     * 新增学生管理
     * 
     * @param studentDto 学生管理
     * @return 结果
     */
    public int insertStudent(StudentDto studentDto);

    /**
     * 修改学生管理
     * 
     * @param studentDto 学生管理
     * @return 结果
     */
    public int updateStudent(StudentDto studentDto);

    /**
     * 删除学生管理
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    public int deleteStudentById(Long id);

    /**
     * 批量删除学生管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentByIds(Long[] ids);

    /**
     * 根据学生id查询用户id
     * @param ids 学生id集合
     * @return 用户id列表
     */
    Long[] selectUserIdsByStudentIds(Long[] ids);
}

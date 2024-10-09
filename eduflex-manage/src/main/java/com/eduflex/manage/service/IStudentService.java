package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.Student;
import com.eduflex.manage.domain.dto.StudentDto;

/**
 * 学生管理Service接口
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
public interface IStudentService 
{
    /**
     * 查询学生管理
     * 
     * @param id 学生管理主键
     * @return 学生管理
     */
    public Student selectStudentById(Long id);

    /**
     * 查询学生管理列表
     * 
     * @param studentDto 学生管理
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
     * 批量删除学生管理
     * 
     * @param ids 需要删除的学生管理主键集合
     * @return 结果
     */
    public int deleteStudentByIds(Long[] ids);

    /**
     * 删除学生管理信息
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    public int deleteStudentById(Long id);

    /**
     * 检验学生登录名唯一性
     * @param studentDto
     * @return
     */
    boolean checkUserNameUnique(StudentDto studentDto);

    /**
     * 检验学生手机号唯一性
     * @param studentDto
     * @return
     */
    boolean checkPhoneUnique(StudentDto studentDto);

    /**
     * 检验学生邮箱唯一性
     * @param studentDto
     * @return
     */
    boolean checkEmailUnique(StudentDto studentDto);

    /**
     * 重置密码
     * @param studentDto 学生信息
     * @return 结果
     */
    int resetPwd(StudentDto studentDto);
}

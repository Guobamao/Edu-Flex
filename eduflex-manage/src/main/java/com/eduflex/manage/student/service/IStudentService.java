package com.eduflex.manage.student.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.common.core.domain.model.RegisterBody;
import com.eduflex.manage.student.domain.Student;
import com.eduflex.manage.student.domain.dto.StudentDto;
import com.eduflex.manage.student.domain.vo.StudentVo;

import java.util.List;

/**
 * 学生管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-10-07
 */
public interface IStudentService extends IService<Student>
{

    /**
     * 查询学生管理列表
     * @return 学生管理集合
     */
    List<Student> selectStudentList();

    /**
     * 新增学生管理
     *
     * @param studentDto 学生管理
     * @return 结果
     */
    int insertStudent(StudentDto studentDto);

    /**
     * 修改学生管理
     *
     * @param studentDto 学生管理
     * @return 结果
     */
    int updateStudent(StudentDto studentDto);

    /**
     * 批量删除学生管理
     *
     * @param idList 需要删除的学生管理主键集合
     * @return 结果
     */
    int deleteStudentByIds(List<Long> idList);

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

    /**
     * 获取学生信息
     *
     * @param userId 学生ID
     * @return
     */
    StudentVo selectStudentById(Long userId);

    /**
     * 构建学生列表集合Vo对象
     *
     * @param studentList 学生列表
     * @param studentDto 查询条件
     * @return 学生列表Vo集合
     */
    List<StudentVo> buildVo(List<Student> studentList, StudentDto studentDto);

    /**
     * 注册学生账号
     * @param user 注册信息
     * @return 结果
     */
    String register(RegisterBody user);
}

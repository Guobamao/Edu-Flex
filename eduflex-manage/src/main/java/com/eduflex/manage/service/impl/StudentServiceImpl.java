package com.eduflex.manage.service.impl;

import java.util.List;

import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.domain.dto.StudentDto;
import com.eduflex.manage.domain.vo.StudentVo;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.StudentMapper;
import com.eduflex.manage.domain.Student;
import com.eduflex.manage.service.IStudentService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 学生管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
@Service
public class StudentServiceImpl implements IStudentService 
{
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ISysUserService userService;
    /**
     * 查询学生管理
     *
     * @param id 学生管理主键
     * @return 学生管理
     */
    @Override
    public StudentVo selectStudentById(Long id)
    {
        return studentMapper.selectStudentById(id);
    }

    /**
     * 查询学生管理列表
     * 
     * @param studentDto 学生管理dto
     * @return 学生管理
     */
    @Override
    public List<Student> selectStudentList(StudentDto studentDto)
    {
        return studentMapper.selectStudentList(studentDto);
    }

    /**
     * 新增学生管理
     * 
     * @param studentDto 学生管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertStudent(StudentDto studentDto)
    {
        // 先新增用户
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        sysUser.setRoleIds(new Long[] { studentDto.getRoleId() });
        userService.insertUser(sysUser);

        // 新增学生表信息
        studentDto.setUserId(sysUser.getUserId());
        return studentMapper.insertStudent(studentDto);
    }

    /**
     * 修改学生管理
     * 
     * @param studentDto 学生管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateStudent(StudentDto studentDto)
    {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        sysUser.setRoleIds(new Long[] { studentDto.getRoleId() });
        userService.updateUser(sysUser);
        return studentMapper.updateStudent(studentDto);
    }

    /**
     * 批量删除学生管理
     * 
     * @param ids 需要删除的学生管理主键
     * @return 结果
     */
    @Override
    public int deleteStudentByIds(Long[] ids)
    {
        // 查询关联的userId
        Long[] userIds = studentMapper.selectUserIdsByStudentIds(ids);
        userService.deleteUserByIds(userIds);
        // 在删除学生表的数据
        return studentMapper.deleteStudentByIds(ids);
    }

    /**
     * 删除学生管理信息
     * 
     * @param id 学生管理主键
     * @return 结果
     */
    @Override
    public int deleteStudentById(Long id)
    {
        Long userId = studentMapper.selectStudentById(id).getUserId();
        userService.deleteUserById(userId);
        return studentMapper.deleteStudentById(id);
    }

    /**
     * 检验学生登录名唯一性
     * @param studentDto
     * @return
     */
    @Override
    public boolean checkUserNameUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.checkUserNameUnique(sysUser);
    }

    /**
     * 检验学生登录名唯一性
     * @param studentDto
     * @return
     */
    @Override
    public boolean checkPhoneUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.checkPhoneUnique(sysUser);
    }

    /**
     * 检验学生邮箱唯一性
     * @param studentDto
     * @return
     */
    @Override
    public boolean checkEmailUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.checkEmailUnique(sysUser);
    }

    /**
     * 重置密码
     * @param studentDto 学生信息
     * @return 结果
     */
    @Override
    public int resetPwd(StudentDto studentDto) {
        return userService.resetPwd(studentDto);
    }
}

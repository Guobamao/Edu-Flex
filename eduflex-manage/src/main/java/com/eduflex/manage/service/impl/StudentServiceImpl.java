package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.DateUtils;
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

import static com.eduflex.common.utils.SecurityUtils.getUsername;

/**
 * 学生管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-07
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService
{
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ISysUserService userService;

    /**
     * 查询学生管理列表
     * 
     * @param studentDto 学生管理dto
     * @return 学生管理
     */
    @Override
    public List<Student> selectStudentList(StudentDto studentDto)
    {
        QueryWrapper<Student> wrapper = new QueryWrapper<Student>()
                .eq(studentDto.getCollegeId() != null, "s.college_id", studentDto.getCollegeId())
                .eq(studentDto.getGradeId() != null, "s.grade_id", studentDto.getGradeId())
                .like(studentDto.getUserName() != null && !studentDto.getUserName().isEmpty(), "u.user_name", studentDto.getUserName())
                .like(studentDto.getNickName() != null && !studentDto.getNickName().isEmpty(), "u.nick_name", studentDto.getNickName())
                .like(studentDto.getPhonenumber() != null && !studentDto.getPhonenumber().isEmpty(), "u.phonenumber", studentDto.getPhonenumber());
        return studentMapper.selectStudentList(wrapper);
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
        Student student = new Student();
        student.setUserId(sysUser.getUserId());
        student.setCollegeId(studentDto.getCollegeId());
        student.setGradeId(studentDto.getGradeId());
        return studentMapper.insert(student);
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

        Student student = new Student();
        student.setId(studentDto.getId());
        student.setCollegeId(studentDto.getCollegeId());
        student.setGradeId(studentDto.getGradeId());
        student.setUpdateBy(getUsername());
        student.setUpdateTime(DateUtils.getNowDate());
        return studentMapper.updateById(student);
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
        ArrayList<Long> idList = CollUtil.toList(ids);
        return studentMapper.deleteByIds(idList);
    }

    /**
     * 检验学生登录名唯一性
     * @param studentDto 查询条件
     * @return 布尔值
     */
    @Override
    public boolean checkUserNameUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.checkUserNameUnique(sysUser);
    }

    /**
     * 检验学生登录名唯一性
     * @param studentDto 查询条件
     * @return 布尔值
     */
    @Override
    public boolean checkPhoneUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.checkPhoneUnique(sysUser);
    }

    /**
     * 检验学生邮箱唯一性
     * @param studentDto 查询条件
     * @return 布尔值
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

    /**
     * 根据ID查询学生信息
     * @param id 学生ID
     * @return 学生信息
     */
    @Override
    public StudentVo selectStudentById(Long id) {
        return studentMapper.selectStudentById(id);
    }
}

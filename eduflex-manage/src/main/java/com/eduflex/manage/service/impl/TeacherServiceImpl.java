package com.eduflex.manage.service.impl;

import java.util.List;

import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.manage.domain.dto.TeacherDto;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.TeacherMapper;
import com.eduflex.manage.domain.Teacher;
import com.eduflex.manage.service.ITeacherService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 教师管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Service
public class TeacherServiceImpl implements ITeacherService 
{
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private ISysUserService userService;

    /**
     * 查询教师管理
     * 
     * @param id 教师管理主键
     * @return 教师管理
     */
    @Override
    public Teacher selectTeacherById(Long id)
    {
        return teacherMapper.selectTeacherById(id);
    }

    /**
     * 查询教师管理列表
     *
     * @param teacherDto 教师管理
     * @return 教师管理
     */
    @Override
    public List<Teacher> selectTeacherList(TeacherDto teacherDto)
    {
        return teacherMapper.selectTeacherList(teacherDto);
    }

    /**
     * 新增教师管理
     * 
     * @param teacherDto 教师管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertTeacher(TeacherDto teacherDto)
    {
        // 先新增用户
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        sysUser.setRoleIds(new Long[] { teacherDto.getRoleId() });
        userService.insertUser(sysUser);

        // 再新增教师表信息
        teacherDto.setUserId(sysUser.getUserId()); // 取到新增用户的id

        return teacherMapper.insertTeacher(teacherDto);
    }

    /**
     * 修改教师管理
     *
     * @param teacherDto 教师管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateTeacher(TeacherDto teacherDto)
    {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        Long userId = sysUser.getUserId();
        sysUser.setRoleIds(new Long[] { teacherDto.getRoleId() });
        userService.updateUser(sysUser);

        return teacherMapper.updateTeacher(teacherDto);
    }

    /**
     * 批量删除教师管理
     * 
     * @param ids 需要删除的教师管理主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByIds(Long[] ids)
    {
        // 查询关联的userId
        Long[] userIds = teacherMapper.selectUserIdsByTeacherIds(ids);
        // 先删除sys_user表中的数据
        userService.deleteUserByIds(userIds);
        // 再删除教师表的数据
        return teacherMapper.deleteTeacherByIds(ids);
    }

    /**
     * 删除教师管理信息
     * 
     * @param id 教师管理主键
     * @return 结果
     */
    @Override
    public int deleteTeacherById(Long id)
    {
        Long userId = teacherMapper.selectTeacherById(id).getUserId();
        userService.deleteUserById(userId);
        return teacherMapper.deleteTeacherById(id);
    }

    /**
     * 检验登录名唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    @Override
    public boolean checkUserNameUnique(TeacherDto teacherDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        return userService.checkUserNameUnique(sysUser);
    }

    /**
     * 检验手机号唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    @Override
    public boolean checkPhoneUnique(TeacherDto teacherDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        return userService.checkPhoneUnique(sysUser);
    }

    /**
     * 检验邮箱唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    @Override
    public boolean checkEmailUnique(TeacherDto teacherDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        return userService.checkEmailUnique(sysUser);
    }
}

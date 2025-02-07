package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.dto.TeacherDto;
import com.eduflex.manage.domain.vo.TeacherVo;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.TeacherMapper;
import com.eduflex.manage.domain.Teacher;
import com.eduflex.manage.service.ITeacherService;
import org.springframework.transaction.annotation.Transactional;

import static com.eduflex.common.utils.SecurityUtils.getUsername;

/**
 * 教师管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements ITeacherService {
    @Autowired
    private ISysUserService userService;

    /**
     * 查询教师管理列表
     *
     * @param teacherDto 教师管理
     * @return 教师管理
     */
    @Override
    public List<TeacherVo> selectTeacherList(TeacherDto teacherDto) {
        LambdaQueryWrapper<Teacher> teacherWrapper = new LambdaQueryWrapper<Teacher>()
                .select(Teacher::getId, Teacher::getUserId);

        List<Long> idList = baseMapper.selectList(teacherWrapper).stream().map(Teacher::getUserId).toList();

        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<SysUser>()
                .in(SysUser::getUserId, idList)
                .like(StrUtil.isNotBlank(teacherDto.getNickName()), SysUser::getNickName, teacherDto.getNickName())
                .like(StrUtil.isNotBlank(teacherDto.getPhonenumber()), SysUser::getPhonenumber, teacherDto.getPhonenumber());
        return buildVo(baseMapper.selectList(teacherWrapper), userService.list(wrapper));
    }

    /**
     * 新增教师管理
     *
     * @param teacherDto 教师管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertTeacher(TeacherDto teacherDto) {
        // 先新增用户
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        sysUser.setRoleIds(new Long[]{teacherDto.getRoleId()});
        userService.insertUser(sysUser);

        // 再新增教师表信息
        Teacher teacher = new Teacher();
        teacher.setUserId(sysUser.getUserId());
        teacher.setCreateBy(getUsername());
        teacher.setCreateTime(DateUtils.getNowDate());

        return baseMapper.insert(teacher);
    }

    /**
     * 修改教师管理
     *
     * @param teacherDto 教师管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateTeacher(TeacherDto teacherDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        sysUser.setRoleIds(new Long[]{teacherDto.getRoleId()});
        userService.updateUser(sysUser);

        Teacher teacher = new Teacher();
        teacher.setId(teacherDto.getId());
        teacher.setCreateBy(getUsername());
        teacher.setCreateTime(DateUtils.getNowDate());
        return baseMapper.updateById(teacher);
    }

    /**
     * 检验登录名唯一性
     *
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
     *
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
     *
     * @param teacherDto 教师DTO
     * @return 结果
     */
    @Override
    public boolean checkEmailUnique(TeacherDto teacherDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        return userService.checkEmailUnique(sysUser);
    }

    /**
     * 根据ID查询教师信息
     *
     * @param id 教师ID
     * @return
     */
    @Override
    public TeacherVo selectTeacherById(Long id) {
        Teacher teacher = baseMapper.selectById(id);
        SysUser sysUser = userService.selectUserById(teacher.getUserId());
        return buildVo(teacher, sysUser);
    }

    private List<TeacherVo> buildVo(List<Teacher> teacherList, List<SysUser> userList) {
        Map<Long, Teacher> teacherMap = new HashMap<>();
        for (Teacher teacher : teacherList) {
            teacherMap.put(teacher.getUserId(), teacher);
        }

        List<TeacherVo> teacherVoList = new ArrayList<>();
        for (SysUser user : userList) {
            TeacherVo teacherVo = new TeacherVo();
            BeanUtils.copyProperties(user, teacherVo);
            Teacher teacher = teacherMap.get(user.getUserId());
            if (teacher != null) {
                BeanUtils.copyProperties(teacher, teacherVo);
            }
            teacherVoList.add(teacherVo);
        }
        return teacherVoList;
    }

    private TeacherVo buildVo(Teacher teacher, SysUser sysUser) {
        TeacherVo teacherVo = new TeacherVo();
        BeanUtils.copyProperties(teacher, teacherVo);
        BeanUtils.copyProperties(sysUser, teacherVo);
        return teacherVo;
    }
}

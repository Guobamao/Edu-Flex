package com.eduflex.manage.student.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.domain.model.RegisterBody;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.framework.web.service.SysRegisterService;
import com.eduflex.manage.student.domain.Student;
import com.eduflex.manage.student.domain.dto.StudentDto;
import com.eduflex.manage.student.domain.vo.StudentGoalVo;
import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.student.mapper.StudentMapper;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.system.domain.SysUserRole;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
    private ISysUserService userService;

    @Autowired
    private SysRegisterService registerService;

    @Override
    public List<Student> selectStudentList()
    {
        LambdaQueryWrapper<Student> studentWrapper = new LambdaQueryWrapper<Student>()
                .select(Student::getId, Student::getUserId);
        return baseMapper.selectList(studentWrapper);
    }

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
        return baseMapper.insert(student);
    }

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
        student.setUpdateBy(getUsername());
        student.setUpdateTime(DateUtils.getNowDate());
        return baseMapper.updateById(student);
    }

    @Override
    @Transactional
    public int deleteStudentByIds(List<Long> idList)
    {
        // 查询关联的userId
        LambdaQueryWrapper<Student> wrapper = new LambdaQueryWrapper<Student>()
                .select(Student::getUserId)
                .in(Student::getId, idList);
        List<Student> studentList = baseMapper.selectList(wrapper);

        List<Long> userIdList = studentList.stream().map(Student::getUserId).toList();
        userService.deleteUserByIds(userIdList);

        // 在删除学生表的数据
        List<Long> ids = studentList.stream().map(Student::getId).toList();
        return baseMapper.deleteByIds(ids);
    }

    @Override
    public boolean checkUserNameUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return !userService.checkUserNameUnique(sysUser);
    }

    @Override
    public boolean checkPhoneUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return !userService.checkPhoneUnique(sysUser);
    }

    @Override
    public boolean checkEmailUnique(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return !userService.checkEmailUnique(sysUser);
    }

    @Override
    public int resetPwd(StudentDto studentDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        return userService.resetPwd(sysUser);
    }

    @Override
    public StudentVo selectStudentById(Long id) {
        Student student = baseMapper.selectById(id);
        SysUser sysUser = userService.selectUserById(student.getUserId());
        return buildVo(student, sysUser);
    }

    @Override
    public List<StudentGoalVo> selectStudentListForGoal(StudentDto studentDto) {
        List<StudentVo> studentList = buildVo(selectStudentList(), studentDto);

        List<StudentGoalVo> studentGoalVos = new ArrayList<>();
        for (StudentVo student : studentList) {
            StudentGoalVo studentGoalVo = new StudentGoalVo();
            BeanUtils.copyProperties(student, studentGoalVo);
            studentGoalVos.add(studentGoalVo);
        }
        return studentGoalVos;
    }

    @Override
    public List<StudentVo> buildVo(List<Student> studentList, StudentDto studentDto) {
        List<Long> idList = studentList.stream().map(Student::getUserId).toList();
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<SysUser>()
                .in(SysUser::getUserId, idList)
                .like(StrUtil.isNotBlank(studentDto.getUserName()), SysUser::getUserName, studentDto.getUserName())
                .like(StrUtil.isNotBlank(studentDto.getNickName()), SysUser::getNickName, studentDto.getNickName())
                .like(StrUtil.isNotBlank(studentDto.getPhonenumber()), SysUser::getPhonenumber, studentDto.getPhonenumber());

        if (StrUtil.isNotBlank(studentDto.getSearchValue())) {
            wrapper.and(w -> w.like(SysUser::getUserName, studentDto.getSearchValue())
                    .or()
                    .like(SysUser::getNickName, studentDto.getSearchValue())
                    .or()
                    .like(SysUser::getPhonenumber, studentDto.getSearchValue())
                    .or()
                    .like(SysUser::getEmail, studentDto.getSearchValue()));
        }
        List<SysUser> userList = userService.list(wrapper);
        return BeanUtil.copyToList(userList, StudentVo.class);
    }

    @Override
    public String register(RegisterBody user) {
        String register = registerService.register(user);
        if (StrUtil.isEmpty(register)) {
            SysUser sysUser = userService.selectUserByUserName(user.getUsername());
            if (sysUser != null) {
                Student student = new Student();
                student.setUserId(sysUser.getUserId());
                baseMapper.insert(student);

                SysUserRole userRole = new SysUserRole();
                userRole.setUserId(sysUser.getUserId());
                userRole.setRoleId(EduFlexConstants.ROLE_STUDENT);
                userService.insertUserRole(userRole);
            }
        }
        return "";
    }

    private StudentVo buildVo(Student student, SysUser sysUser) {
        StudentVo studentVo = new StudentVo();
        BeanUtils.copyProperties(student, studentVo);
        BeanUtils.copyProperties(sysUser, studentVo);
        return studentVo;
    }
}

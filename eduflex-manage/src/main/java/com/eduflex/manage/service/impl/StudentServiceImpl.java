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
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.domain.GoalStudent;
import com.eduflex.manage.domain.dto.StudentDto;
import com.eduflex.manage.domain.vo.StudentGoalVo;
import com.eduflex.manage.domain.vo.StudentVo;
import com.eduflex.manage.service.IGoalStudentService;
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
    private ISysUserService userService;

    @Autowired
    private IGoalStudentService goalStudentService;

    @Override
    public List<StudentVo> selectStudentList(StudentDto studentDto)
    {
        LambdaQueryWrapper<Student> studentWrapper = new LambdaQueryWrapper<Student>()
                .select(Student::getId, Student::getUserId);

        List<Long> idList = baseMapper.selectList(studentWrapper).stream().map(Student::getUserId).toList();

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
        return buildVo(baseMapper.selectList(studentWrapper), userService.list(wrapper));
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
        List<StudentVo> studentList = selectStudentList(studentDto);

        List<StudentGoalVo> studentGoalVos = new ArrayList<>();
        for (StudentVo student : studentList) {
            StudentGoalVo studentGoalVo = new StudentGoalVo();
            BeanUtils.copyProperties(student, studentGoalVo);
            GoalStudent goalStudent = goalStudentService.getByUserId(student.getUserId());
            studentGoalVo.setIsSelected(goalStudent != null);
            studentGoalVos.add(studentGoalVo);
        }
        return studentGoalVos;
    }

    private List<StudentVo> buildVo(List<Student> studentList, List<SysUser> userList) {
        Map<Long, Student> studentMap = new HashMap<>();
        for (Student student : studentList) {
            studentMap.put(student.getUserId(), student);
        }

        List<StudentVo> studentVoList = new ArrayList<>();
        for (SysUser user : userList) {
            StudentVo studentVo = new StudentVo();
            BeanUtils.copyProperties(user, studentVo);
            Student student = studentMap.get(user.getUserId());
            if (student != null) {
                BeanUtils.copyProperties(student, studentVo);
            }
            studentVoList.add(studentVo);
        }
        return studentVoList;
    }

    private StudentVo buildVo(Student student, SysUser sysUser) {
        StudentVo studentVo = new StudentVo();
        BeanUtils.copyProperties(student, studentVo);
        BeanUtils.copyProperties(sysUser, studentVo);
        return studentVo;
    }
}

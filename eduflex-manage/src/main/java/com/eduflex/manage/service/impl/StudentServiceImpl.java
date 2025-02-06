package com.eduflex.manage.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.domain.GoalStudent;
import com.eduflex.manage.domain.dto.StudentDto;
import com.eduflex.manage.domain.vo.StudentGoalVo;
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
    public List<Student> selectStudentList(StudentDto studentDto)
    {
        LambdaQueryWrapper<Student> wrapper = new LambdaQueryWrapper<Student>()
                .like(StrUtil.isNotBlank(studentDto.getUserName()), Student::getUserName, studentDto.getUserName())
                .like(StrUtil.isNotBlank(studentDto.getNickName()), Student::getNickName, studentDto.getNickName())
                .like(StrUtil.isNotBlank(studentDto.getPhonenumber()), Student::getPhonenumber, studentDto.getPhonenumber());

        if (StrUtil.isNotBlank(studentDto.getSearchValue())) {
            wrapper.and(w -> w.like(Student::getUserName, studentDto.getSearchValue())
                    .or()
                    .like(Student::getNickName, studentDto.getSearchValue())
                    .or()
                    .like(Student::getPhonenumber, studentDto.getSearchValue())
                    .or()
                    .like(Student::getEmail, studentDto.getSearchValue()));
        }
        return baseMapper.selectStudentList(wrapper);
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
    public int deleteStudentByIds(Long[] ids)
    {
        // 查询关联的userId
        Long[] userIds = baseMapper.selectUserIdsByStudentIds(ids);
        userService.deleteUserByIds(userIds);
        // 在删除学生表的数据
        ArrayList<Long> idList = CollUtil.toList(ids);
        return baseMapper.deleteByIds(idList);
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
        return userService.resetPwd(studentDto);
    }

    @Override
    public Student selectStudentById(Long id) {
        return baseMapper.selectStudentById(id);
    }

    @Override
    public List<StudentGoalVo> selectStudentListForGoal(StudentDto studentDto) {
        List<Student> studentList = selectStudentList(studentDto);

        List<StudentGoalVo> studentGoalVos = new ArrayList<>();
        for (Student student : studentList) {
            StudentGoalVo studentGoalVo = new StudentGoalVo();
            BeanUtils.copyProperties(student, studentGoalVo);
            GoalStudent goalStudent = goalStudentService.getByUserId(student.getUserId());
            studentGoalVo.setIsSelected(goalStudent != null);
            studentGoalVos.add(studentGoalVo);
        }
        return studentGoalVos;
    }
}

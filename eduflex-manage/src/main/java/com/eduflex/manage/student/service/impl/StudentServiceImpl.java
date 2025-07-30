package com.eduflex.manage.student.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.domain.model.RegisterBody;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.common.utils.bean.BeanValidators;
import com.eduflex.framework.web.service.SysRegisterService;
import com.eduflex.manage.student.domain.Student;
import com.eduflex.manage.student.domain.dto.StudentDto;
import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.student.mapper.StudentMapper;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.system.domain.SysUserRole;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.validation.Validator;
import java.util.List;

/**
 * 学生管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2024-10-07
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysRegisterService registerService;

    @Autowired
    protected Validator validator;

    @Override
    public List<Student> selectStudentList() {
        LambdaQueryWrapper<Student> studentWrapper = new LambdaQueryWrapper<Student>()
                .select(Student::getId, Student::getUserId);
        return baseMapper.selectList(studentWrapper);
    }

    @Transactional
    @Override
    public int insertStudent(StudentDto studentDto) {
        // 设置角色为学生
        studentDto.setRoleId(EduFlexConstants.ROLE_STUDENT);
        studentDto.setStatus(EduFlexConstants.STUDENT_STATUS_ENABLED);
        studentDto.setAvatar(EduFlexConstants.DEFAULT_AVATAR);

        if (StrUtil.isNotBlank(studentDto.getPassword())) {
            studentDto.setPassword(SecurityUtils.encryptPassword(studentDto.getPassword()));
        } else {
            studentDto.setPassword(SecurityUtils.encryptPassword("Axy" + studentDto.getUserName()));
        }

        // 先新增用户
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        sysUser.setRoleIds(new Long[]{studentDto.getRoleId()});
        userService.insertUser(sysUser);

        // 新增学生表信息
        Student student = new Student();
        student.setUserId(sysUser.getUserId());
        student.setCreateBy(studentDto.getCreateBy());

        return baseMapper.insert(student);
    }

    @Transactional
    @Override
    public int updateStudent(StudentDto studentDto) {
        studentDto.setRoleId(EduFlexConstants.ROLE_STUDENT);
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(studentDto, sysUser);
        sysUser.setRoleIds(new Long[]{studentDto.getRoleId()});
        return userService.updateUser(sysUser);
    }

    @Override
    @Transactional
    public int deleteStudentByIds(List<Long> idList) {
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
    public StudentVo selectStudentById(Long userId) {
        SysUser sysUser = userService.selectUserById(userId);
        return BeanUtil.copyProperties(sysUser, StudentVo.class);
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

    @Override
    public String importStudent(List<StudentDto> studentList, boolean uploadSupport, String operName) {
        if (studentList.isEmpty()) {
            throw new ServiceException("导入学生数据不能为空！");
        }

        int successNum = 0;
        int failedNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (StudentDto studentDto : studentList) {
            try {
                // 验证是否存在该学生
                SysUser sysUser = userService.selectUserByUserName(studentDto.getUserName());
                if (sysUser == null) {
                    BeanValidators.validateWithException(validator, studentDto);
                    studentDto.setSex(EduFlexConstants.SEX_UNKNOWN);
                    studentDto.setCreateBy(operName);
                    insertStudent(studentDto);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + studentDto.getUserName() + " 导入成功");
                } else if (uploadSupport) {
                    BeanValidators.validateWithException(validator, studentDto);
                    userService.checkUserAllowed(sysUser);
                    studentDto.setUserId(sysUser.getUserId());
                    studentDto.setUpdateBy(operName);
                    updateStudent(studentDto);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + studentDto.getUserName() + " 更新成功");
                } else {
                    failedNum++;
                    failureMsg.append("<br/>" + failedNum + "、账号 " + studentDto.getUserName() + " 已存在");
                }
            } catch (Exception e) {
                failedNum++;
                String msg = "<br/>" + failedNum + "、账号 " + studentDto.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failedNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failedNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}

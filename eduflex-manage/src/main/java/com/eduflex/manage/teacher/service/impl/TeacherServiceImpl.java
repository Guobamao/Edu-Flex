package com.eduflex.manage.teacher.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.bean.BeanValidators;
import com.eduflex.manage.course.domain.Course;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.teacher.domain.Teacher;
import com.eduflex.manage.teacher.domain.dto.TeacherDto;
import com.eduflex.manage.teacher.domain.vo.TeacherVo;
import com.eduflex.manage.teacher.mapper.TeacherMapper;
import com.eduflex.manage.teacher.service.ITeacherService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validator;
import java.util.List;

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

    @Autowired
    protected Validator validator;

    @Autowired
    private ICourseService courseService;

    /**
     * 查询教师管理列表
     *
     * @param teacherDto 教师管理
     * @return 教师管理
     */
    @Override
    public List<Teacher> selectTeacherList(TeacherDto teacherDto) {
        LambdaQueryWrapper<Teacher> teacherWrapper = new LambdaQueryWrapper<Teacher>()
                .select(Teacher::getId, Teacher::getUserId);

        return baseMapper.selectList(teacherWrapper);
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
        // 设置角色ID为教师
        teacherDto.setRoleId(EduFlexConstants.ROLE_TEACHER);
        // 默认状态：启用
        teacherDto.setStatus(EduFlexConstants.TEACHER_STATUS_ENABLED);
        // 设置默认头像
        teacherDto.setAvatar(EduFlexConstants.DEFAULT_AVATAR);

        if (StrUtil.isNotBlank(teacherDto.getPassword())) {
            teacherDto.setPassword(SecurityUtils.encryptPassword(teacherDto.getPassword()));
        } else {
            teacherDto.setPassword(SecurityUtils.encryptPassword("Axy" + teacherDto.getUserName()));
        }

        // 先新增用户
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        sysUser.setRoleIds(new Long[]{teacherDto.getRoleId()});
        userService.insertUser(sysUser);

        // 再新增教师表信息
        Teacher teacher = new Teacher();
        teacher.setUserId(sysUser.getUserId());
        teacher.setCreateBy(teacherDto.getCreateBy());

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
        teacherDto.setRoleId(EduFlexConstants.ROLE_TEACHER);
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(teacherDto, sysUser);
        sysUser.setRoleIds(new Long[]{teacherDto.getRoleId()});
        return userService.updateUser(sysUser);
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
     * @param userId 教师ID
     * @return
     */
    @Override
    public TeacherVo selectTeacherByUserId(Long userId) {
        SysUser sysUser = userService.selectUserById(userId);
        return buildVo(sysUser);
    }

    @Override
    public String importTeacher(List<TeacherDto> tearcherList, boolean uploadSupport, String operName) {
        if (tearcherList.isEmpty()) {
            throw new ServiceException("导入教师数据不能为空！");
        }

        int successNum = 0;
        int failedNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (TeacherDto teacherDto : tearcherList) {
            try {
                // 验证是否存在该教师
                SysUser sysUser = userService.selectUserByUserName(teacherDto.getUserName());
                if (sysUser == null) {
                    BeanValidators.validateWithException(validator, teacherDto);
                    teacherDto.setSex(EduFlexConstants.SEX_UNKNOWN);
                    teacherDto.setCreateBy(operName);
                    insertTeacher(teacherDto);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + teacherDto.getUserName() + " 导入成功");
                } else if (uploadSupport) {
                    BeanValidators.validateWithException(validator, teacherDto);
                    userService.checkUserAllowed(sysUser);
                    teacherDto.setUserId(sysUser.getUserId());
                    teacherDto.setUpdateBy(operName);
                    updateTeacher(teacherDto);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + teacherDto.getUserName() + " 更新成功");
                } else {
                    failedNum++;
                    failureMsg.append("<br/>" + failedNum + "、账号 " + teacherDto.getUserName() + " 已存在");
                }
            } catch (Exception e) {
                failedNum++;
                String msg = "<br/>" + failedNum + "、账号 " + teacherDto.getUserName() + " 导入失败：";
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

    @Override
    public List<TeacherVo> buildVo(List<Teacher> teacherList, TeacherDto teacherDto) {
        List<Long> idList = teacherList.stream().map(Teacher::getUserId).toList();
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<SysUser>()
                .in(SysUser::getUserId, idList)
                .like(StrUtil.isNotBlank(teacherDto.getNickName()), SysUser::getNickName, teacherDto.getNickName())
                .like(StrUtil.isNotBlank(teacherDto.getPhonenumber()), SysUser::getPhonenumber, teacherDto.getPhonenumber());

        if (StrUtil.isNotBlank(teacherDto.getSearchValue())) {
            wrapper.and(w -> w.like(SysUser::getUserName, teacherDto.getSearchValue()))
                    .or()
                    .like(SysUser::getNickName, teacherDto.getSearchValue())
                    .or()
                    .like(SysUser::getPhonenumber, teacherDto.getSearchValue())
                    .or()
                    .like(SysUser::getEmail, teacherDto.getSearchValue());
        }
        List<SysUser> userList = userService.list(wrapper);
        List<TeacherVo> teacherVoList = BeanUtil.copyToList(userList, TeacherVo.class);

        for (TeacherVo teacherVo : teacherVoList) {
            long count = courseService.count(Wrappers.<Course>lambdaQuery().eq(Course::getTeacherId, teacherVo.getUserId()));
            teacherVo.setCourseCount((int) count);
        }
        return teacherVoList;
    }

    private TeacherVo buildVo(SysUser sysUser) {
        TeacherVo teacherVo = new TeacherVo();
        BeanUtils.copyProperties(sysUser, teacherVo);
        return teacherVo;
    }
}

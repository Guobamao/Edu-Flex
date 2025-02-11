package com.eduflex.manage.teacher.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.teacher.domain.Teacher;
import com.eduflex.manage.teacher.domain.dto.TeacherDto;
import com.eduflex.manage.teacher.domain.vo.TeacherVo;

/**
 * 教师管理Service接口
 *
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface ITeacherService extends IService<Teacher>
{
    /**
     * 查询教师管理列表
     *
     * @param teacherDto 教师管理
     * @return 教师管理集合
     */
    List<TeacherVo> selectTeacherList(TeacherDto teacherDto);

    /**
     * 新增教师管理
     *
     * @param teacherDto 教师管理
     * @return 结果
     */
    int insertTeacher(TeacherDto teacherDto);

    /**
     * 修改教师管理
     *
     * @param teacherDto 教师管理
     * @return 结果
     */
    int updateTeacher(TeacherDto teacherDto);

    /**
     * 检验登录名唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    boolean checkUserNameUnique(TeacherDto teacherDto);

    /**
     * 检验手机号唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    boolean checkPhoneUnique(TeacherDto teacherDto);

    /**
     * 检验邮箱唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    boolean checkEmailUnique(TeacherDto teacherDto);

    /**
     * 根据ID查询教师信息
     * @param id 教师ID
     * @return
     */
    Teacher selectTeacherById(Long id);
}

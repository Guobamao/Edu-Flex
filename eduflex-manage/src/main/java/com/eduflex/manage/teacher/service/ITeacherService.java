package com.eduflex.manage.teacher.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.teacher.domain.Teacher;
import com.eduflex.manage.teacher.domain.dto.TeacherDto;
import com.eduflex.manage.teacher.domain.vo.TeacherVo;

import java.util.List;

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
    List<Teacher> selectTeacherList(TeacherDto teacherDto);

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
    TeacherVo selectTeacherById(Long id);

    /**
     * 构建教师集合Vo对象
     * @param teacherList 教师集合
     * @param teacherDto 查询条件
     * @return 教师集合Vo对象
     */
    List<TeacherVo> buildVo(List<Teacher> teacherList, TeacherDto teacherDto);
}

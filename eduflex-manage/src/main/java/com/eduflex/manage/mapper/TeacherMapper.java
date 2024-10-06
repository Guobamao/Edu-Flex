package com.eduflex.manage.mapper;

import java.util.List;
import com.eduflex.manage.domain.Teacher;
import com.eduflex.manage.domain.dto.TeacherDto;

/**
 * 教师管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
public interface TeacherMapper 
{
    /**
     * 查询教师管理
     * 
     * @param id 教师管理主键
     * @return 教师管理
     */
    public Teacher selectTeacherById(Long id);

    /**
     * 查询教师管理列表
     * 
     * @param teacherDto 教师管理
     * @return 教师管理集合
     */
    public List<Teacher> selectTeacherList(TeacherDto teacherDto);

    /**
     * 新增教师管理
     * 
     * @param teacherDto 教师管理
     * @return 结果
     */
    public int insertTeacher(TeacherDto teacherDto);

    /**
     * 修改教师管理
     * 
     * @param teacherDto 教师管理
     * @return 结果
     */
    public int updateTeacher(TeacherDto teacherDto);

    /**
     * 删除教师管理
     * 
     * @param id 教师管理主键
     * @return 结果
     */
    public int deleteTeacherById(Long id);

    /**
     * 批量删除教师管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeacherByIds(Long[] ids);

    /**
     * 检验登录名唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    int checkUserNameUnique(TeacherDto teacherDto);

    /**
     * 检验手机号唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    int checkPhoneUnique(TeacherDto teacherDto);

    /**
     * 检验邮箱唯一性
     * @param teacherDto 教师DTO
     * @return 结果
     */
    int checkEmailUnique(TeacherDto teacherDto);

    /**
     * 查询教师id集合
     * @param ids
     * @return
     */
    Long[] selectUserIdsByTeacherIds(Long[] ids);
}

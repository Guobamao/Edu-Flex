package com.eduflex.manage.student.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.student.domain.Student;
import com.eduflex.manage.student.domain.dto.StudentDto;
import com.eduflex.manage.student.domain.vo.StudentGoalVo;
import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.student.service.IStudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学生管理Controller
 *
 * @author 林煜鋒
 * @date 2024-10-07
 */
@RestController
@RequestMapping("/manage/student")
public class StudentController extends BaseController
{
    @Autowired
    private IStudentService studentService;

    /**
     * 查询学生管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(StudentDto studentDto)
    {
        startPage();
        PageInfo<Student> pageInfo = new PageInfo<>(studentService.selectStudentList());
        List<StudentVo> list = studentService.buildVo(pageInfo.getList(), studentDto);
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 查询学生管理列表（目标关联学生）
     * @param studentDto 查询条件
     * @return 结果
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/goal/list")
    public TableDataInfo listForGoal(StudentDto studentDto) {
        startPage();
        List<StudentGoalVo> list = studentService.selectStudentListForGoal(studentDto);
        return getDataTable(list);
    }

    /**
     * 导出学生管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学生管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudentDto studentDto)
    {
        List<StudentVo> list = studentService.buildVo(studentService.selectStudentList(), studentDto);
        ExcelUtil<StudentVo> util = new ExcelUtil<>(StudentVo.class);
        util.exportExcel(response, list, "学生管理数据");
    }

    /**
     * 获取学生管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(studentService.selectStudentById(id));
    }

    /**
     * 新增学生管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学生管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudentDto studentDto)
    {
        // 检验字段唯一性
        if (studentService.checkUserNameUnique(studentDto)) {
            return error("新增学生‘" + studentDto.getUserName() + "'失败，登录账号已存在");
        } else if (StrUtil.isNotBlank(studentDto.getPhonenumber()) && studentService.checkPhoneUnique(studentDto)) {
            return error("新增学生‘" + studentDto.getUserName() + "'失败，手机号码已存在");
        } else if (StrUtil.isNotBlank(studentDto.getEmail()) && studentService.checkEmailUnique(studentDto)) {
            return error("新增学生‘" + studentDto.getUserName() + "'失败，邮箱账号已存在");
        }

        // 设置角色为学生
        studentDto.setRoleId(EduFlexConstants.ROLE_STUDENT);
        studentDto.setCreateBy(getUsername());
        studentDto.setStatus(EduFlexConstants.STUDENT_STATUS_ENABLED);
        studentDto.setAvatar(EduFlexConstants.DEFAULT_AVATAR);
        if (StrUtil.isNotBlank(studentDto.getPassword())) {
            studentDto.setPassword(SecurityUtils.encryptPassword(studentDto.getPassword()));
        } else {
            studentDto.setPassword(SecurityUtils.encryptPassword("Axy" + studentDto.getUserName()));
        }
        return toAjax(studentService.insertStudent(studentDto));
    }

    /**
     * 修改学生管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学生管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudentDto studentDto)
    {
        if (studentService.checkUserNameUnique(studentDto)) {
            return error("修改学生‘" + studentDto.getUserName() + "'失败，登录账号已存在");
        } else if (StrUtil.isNotBlank(studentDto.getPhonenumber()) && studentService.checkPhoneUnique(studentDto)) {
            return error("修改学生‘" + studentDto.getUserName() + "'失败，手机号码已存在");
        } else if (StrUtil.isNotBlank(studentDto.getEmail()) && studentService.checkEmailUnique(studentDto)) {
            return error("修改学生'" + studentDto.getUserName() + "'失败，邮箱账号已存在");
        }
        studentDto.setRoleId(EduFlexConstants.ROLE_STUDENT);
        studentDto.setUpdateBy(getUsername());
        studentDto.setUpdateTime(DateUtils.getNowDate());
        return toAjax(studentService.updateStudent(studentDto));
    }

    /**
     * 删除学生管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学生管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(studentService.deleteStudentByIds(idList));
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学生管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody StudentDto studentDto) {
        studentDto.setPassword(SecurityUtils.encryptPassword("Axy" + studentDto.getUserName()));
        studentDto.setUpdateBy(getUsername());
        studentDto.setUpdateTime(DateUtils.getNowDate());
        return toAjax(studentService.resetPwd(studentDto));
    }
}

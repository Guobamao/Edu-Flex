package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.manage.domain.dto.TeacherDto;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.manage.domain.Teacher;
import com.eduflex.manage.service.ITeacherService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 教师管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@RestController
@RequestMapping("/manage/teacher")
public class TeacherController extends BaseController
{
    @Autowired
    private ITeacherService teacherService;

    /**
     * 查询教师管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:list')")
    @GetMapping("/list")
    public TableDataInfo list(TeacherDto teacherDto)
    {
        startPage();
        List<Teacher> list = teacherService.selectTeacherList(teacherDto);
        return getDataTable(list);
    }

    /**
     * 导出教师管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:export')")
    @Log(title = "教师管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TeacherDto teacherDto)
    {
        List<Teacher> list = teacherService.selectTeacherList(teacherDto);
        ExcelUtil<Teacher> util = new ExcelUtil<Teacher>(Teacher.class);
        util.exportExcel(response, list, "教师管理数据");
    }

    /**
     * 获取教师管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(teacherService.selectTeacherById(id));
    }

    /**
     * 新增教师管理
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:add')")
    @Log(title = "教师管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TeacherDto teacherDto)
    {
        // 检验字段唯一性
        if (!teacherService.checkUserNameUnique(teacherDto)) {
            return error("新增教师‘" + teacherDto.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(teacherDto.getPhonenumber()) && !teacherService.checkPhoneUnique(teacherDto)) {
            return error("新增教师‘" + teacherDto.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(teacherDto.getEmail()) && !teacherService.checkEmailUnique(teacherDto)) {
            return error("新增教师‘" + teacherDto.getUserName() + "'失败，邮箱账号已存在");
        }

        teacherDto.setRoleId(EduFlexConstants.ROLE_TEACHER); // 设置角色ID为教师
        teacherDto.setCreateBy(getUsername());
        teacherDto.setStatus(EduFlexConstants.TEACHER_STATUS_ENABLED);
        teacherDto.setPassword(SecurityUtils.encryptPassword(teacherDto.getPassword()));
        return toAjax(teacherService.insertTeacher(teacherDto));
    }

    /**
     * 修改教师管理
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:edit')")
    @Log(title = "教师管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TeacherDto teacherDto)
    {
        // 检验字段唯一性
        if (!teacherService.checkUserNameUnique(teacherDto)) {
            return error("修改教师‘" + teacherDto.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(teacherDto.getPhonenumber()) && !teacherService.checkPhoneUnique(teacherDto)) {
            return error("修改教师‘" + teacherDto.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(teacherDto.getEmail()) && !teacherService.checkEmailUnique(teacherDto)) {
            return error("修改教师‘" + teacherDto.getUserName() + "'失败，邮箱账号已存在");
        }
        teacherDto.setRoleId(EduFlexConstants.ROLE_TEACHER);
        teacherDto.setUpdateBy(getUsername());
        teacherDto.setUpdateTime(DateUtils.getNowDate());
        return toAjax(teacherService.updateTeacher(teacherDto));
    }

    /**
     * 删除教师管理
     */
    @PreAuthorize("@ss.hasPermi('manage:teacher:remove')")
    @Log(title = "教师管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(teacherService.deleteTeacherByIds(ids));
    }
}

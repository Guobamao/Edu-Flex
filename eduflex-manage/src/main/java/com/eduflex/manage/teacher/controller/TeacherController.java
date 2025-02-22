package com.eduflex.manage.teacher.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.SecurityUtils;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.teacher.domain.Teacher;
import com.eduflex.manage.teacher.domain.dto.TeacherDto;
import com.eduflex.manage.teacher.domain.vo.TeacherVo;
import com.eduflex.manage.teacher.service.ITeacherService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

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
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(TeacherDto teacherDto)
    {
        startPage();
        PageInfo<Teacher> pageInfo = new PageInfo<>(teacherService.selectTeacherList(teacherDto));
        List<TeacherVo> list = teacherService.buildVo(pageInfo.getList(), teacherDto);
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出教师管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "教师管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TeacherDto teacherDto)
    {
        List<TeacherVo> list = teacherService.buildVo(teacherService.selectTeacherList(teacherDto), teacherDto);
        ExcelUtil<TeacherVo> util = new ExcelUtil<>(TeacherVo.class);
        util.exportExcel(response, list, "教师管理数据");
    }

    /**
     * 获取教师管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(teacherService.selectTeacherById(id));
    }

    /**
     * 新增教师管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
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

        // 设置角色ID为教师
        teacherDto.setRoleId(EduFlexConstants.ROLE_TEACHER);
        teacherDto.setCreateBy(getUsername());
        teacherDto.setStatus(EduFlexConstants.TEACHER_STATUS_ENABLED);
        teacherDto.setPassword(SecurityUtils.encryptPassword(teacherDto.getPassword()));
        teacherDto.setAvatar(EduFlexConstants.DEFAULT_AVATAR);
        return toAjax(teacherService.insertTeacher(teacherDto));
    }

    /**
     * 修改教师管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
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
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "教师管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        ArrayList<Long> idList = CollUtil.toList(ids);
        return toAjax(teacherService.removeByIds(idList));
    }
}

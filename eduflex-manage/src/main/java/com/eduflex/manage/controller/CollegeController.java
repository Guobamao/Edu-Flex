package com.eduflex.manage.controller;

import java.util.List;

import com.eduflex.common.utils.DateUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
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
import com.eduflex.manage.domain.College;
import com.eduflex.manage.service.ICollegeService;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学院管理Controller
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@RestController
@RequestMapping("/manage/college")
public class CollegeController extends BaseController
{
    @Autowired
    private ICollegeService collegeService;

    /**
     * 查询学院管理列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list")
    public TableDataInfo list(College college)
    {
        startPage();
        List<College> colleges = collegeService.selectCollegeList(college);
        return getDataTable(colleges);
    }

    /**
     * 查询学院列表（排除节点）
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping("/list/exclude/{id}")
    public AjaxResult excludeChild(@PathVariable(value = "id", required = false) Long id) {
        List<College> colleges = collegeService.selectCollegeList(new College());
        colleges.removeIf(c -> c.getId().longValue() == id || ArrayUtils.contains(StringUtils.split(c.getAncestors(), ","), id + ""));
        return success(colleges);
    }

    /**
     * 获取学院管理详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(collegeService.getById(id));
    }

    /**
     * 新增学院管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学院管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody College college)
    {
        // 校验名称唯一性
        if (!collegeService.checkCollegeNameUnique(college)) {
            return warn("新增学院'" + college.getName() + "'失败，学院名称已存在");
        }
        college.setCreateBy(getUsername());
        return toAjax(collegeService.insertCollege(college));
    }

    /**
     * 修改学院管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学院管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody College college)
    {
        Long collegeId = college.getId();
        if (!collegeService.checkCollegeNameUnique(college)) {
            return warn("修改学院'" + college.getName() + "'失败，学院名称已存在");
        } else if (college.getParentId().equals(collegeId)) {
            return warn("修改学院'" + college.getName() + "'失败，上级学院不能选择自己");
        }
        college.setUpdateBy(getUsername());
        college.setUpdateTime(DateUtils.getNowDate());
        return toAjax(collegeService.updateById(college));
    }

    /**
     * 删除学院管理
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "学院管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{collegeId}")
    public AjaxResult remove(@PathVariable Long collegeId)
    {
        if (collegeService.hasChildByCollegeId(collegeId)) {
            return warn("存在下级学院,不允许删除");
        }
        // TODO: 增加检验学院是否存在教师或学生的判断
        boolean b = collegeService.removeById(collegeId);
        return toAjax(b);
    }
}

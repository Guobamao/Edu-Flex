package com.eduflex.manage.direction.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.direction.domain.Direction;
import com.eduflex.manage.direction.service.IDirectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 课程方向Controller
 *
 * @author 林煜鋒
 * @date 2025-02-12
 */
@RestController
@RequestMapping("/manage/direction")
public class DirectionController extends BaseController
{
    @Autowired
    private IDirectionService directionService;

    /**
     * 查询课程方向列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Direction direction)
    {
        startPage();
        List<Direction> list = directionService.selectDirectionList(direction);
        return getDataTable(list);
    }

    /**
     * 导出课程方向列表
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程方向", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Direction direction)
    {
        List<Direction> list = directionService.selectDirectionList(direction);
        ExcelUtil<Direction> util = new ExcelUtil<>(Direction.class);
        util.exportExcel(response, list, "课程方向数据");
    }

    /**
     * 获取课程方向详细信息
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(directionService.getById(id));
    }

    /**
     * 新增课程方向
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程方向", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Direction direction)
    {
        direction.setCreateBy(getUsername());
        direction.setCreateTime(DateUtils.getNowDate());
        return toAjax(directionService.save(direction));
    }

    /**
     * 修改课程方向
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程方向", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Direction direction)
    {
        direction.setUpdateBy(getUsername());
        direction.setUpdateTime(DateUtils.getNowDate());
        return toAjax(directionService.updateById(direction));
    }

    /**
     * 删除课程方向
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "课程方向", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(directionService.removeDirection(idList));
    }
}

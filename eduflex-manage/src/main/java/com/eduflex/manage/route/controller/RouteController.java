package com.eduflex.manage.route.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.route.domain.vo.RouteVo;
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
import com.eduflex.manage.route.domain.Route;
import com.eduflex.manage.route.service.IRouteService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 学习路线管理Controller
 *
 * @author 林煜鋒
 * @date 2025-02-05
 */
@RestController
@RequestMapping("/manage/route")
public class RouteController extends BaseController
{
    @Autowired
    private IRouteService learningRouteService;

    /**
     * 查询学习路线管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:route:list')")
    @GetMapping("/list")
    public TableDataInfo list(Route route)
    {
        startPage();
        List<RouteVo> list = learningRouteService.selectLearningRouteList(route);
        return getDataTable(list);
    }

    /**
     * 导出学习路线管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:route:export')")
    @Log(title = "学习路线管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Route route)
    {
        List<RouteVo> list = learningRouteService.selectLearningRouteList(route);
        ExcelUtil<RouteVo> util = new ExcelUtil<>(RouteVo.class);
        util.exportExcel(response, list, "学习路线管理数据");
    }

    /**
     * 获取学习路线管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:route:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(learningRouteService.getById(id));
    }

    /**
     * 新增学习路线管理
     */
    @PreAuthorize("@ss.hasPermi('manage:route:add')")
    @Log(title = "学习路线管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Route route)
    {
        route.setCreateBy(getUsername());
        route.setCreateTime(DateUtils.getNowDate());
        return toAjax(learningRouteService.save(route));
    }

    /**
     * 修改学习路线管理
     */
    @PreAuthorize("@ss.hasPermi('manage:route:edit')")
    @Log(title = "学习路线管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Route route)
    {
        route.setUpdateBy(getUsername());
        route.setUpdateTime(DateUtils.getNowDate());
        return toAjax(learningRouteService.updateById(route));
    }

    /**
     * 删除学习路线管理
     */
    @PreAuthorize("@ss.hasPermi('manage:route:remove')")
    @Log(title = "学习路线管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(learningRouteService.removeByIds(idList));
    }
}

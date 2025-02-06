package com.eduflex.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.domain.vo.LearningRouteVo;
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
import com.eduflex.manage.domain.LearningRoute;
import com.eduflex.manage.service.ILearningRouteService;
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
public class LearningRouteController extends BaseController
{
    @Autowired
    private ILearningRouteService learningRouteService;

    /**
     * 查询学习路线管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:route:list')")
    @GetMapping("/list")
    public TableDataInfo list(LearningRoute learningRoute)
    {
        startPage();
        List<LearningRouteVo> list = learningRouteService.selectLearningRouteList(learningRoute);
        return getDataTable(list);
    }

    /**
     * 导出学习路线管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:route:export')")
    @Log(title = "学习路线管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LearningRoute learningRoute)
    {
        List<LearningRouteVo> list = learningRouteService.selectLearningRouteList(learningRoute);
        ExcelUtil<LearningRouteVo> util = new ExcelUtil<>(LearningRouteVo.class);
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
    public AjaxResult add(@RequestBody LearningRoute learningRoute)
    {
        learningRoute.setCreateBy(getUsername());
        learningRoute.setCreateTime(DateUtils.getNowDate());
        return toAjax(learningRouteService.save(learningRoute));
    }

    /**
     * 修改学习路线管理
     */
    @PreAuthorize("@ss.hasPermi('manage:route:edit')")
    @Log(title = "学习路线管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LearningRoute learningRoute)
    {
        learningRoute.setUpdateBy(getUsername());
        learningRoute.setUpdateTime(DateUtils.getNowDate());
        return toAjax(learningRouteService.updateById(learningRoute));
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

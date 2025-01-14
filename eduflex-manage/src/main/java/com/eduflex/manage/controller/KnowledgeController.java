package com.eduflex.manage.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
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
import com.eduflex.manage.domain.Knowledge;
import com.eduflex.manage.service.IKnowledgeService;
import com.eduflex.common.utils.poi.ExcelUtil;

/**
 * 知识点分类Controller
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/manage/knowledge")
public class KnowledgeController extends BaseController
{
    @Autowired
    private IKnowledgeService knowledgeService;

    /**
     * 查询知识点分类列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public AjaxResult list(Knowledge knowledge)
    {
        List<Knowledge> list = knowledgeService.selectKnowledgeList(knowledge);
        return success(list);
    }

    /**
     * 导出知识点分类列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "知识点分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Knowledge knowledge)
    {
        List<Knowledge> list = knowledgeService.selectKnowledgeList(knowledge);
        ExcelUtil<Knowledge> util = new ExcelUtil<Knowledge>(Knowledge.class);
        util.exportExcel(response, list, "知识点分类数据");
    }

    /**
     * 获取知识点分类详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(knowledgeService.getById(id));
    }

    /**
     * 新增知识点分类
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "知识点分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Knowledge knowledge)
    {
        knowledge.setCreateBy(getUsername());
        knowledge.setCreateTime(DateUtils.getNowDate());
        return toAjax(knowledgeService.insertKnowledge(knowledge));
    }

    /**
     * 修改知识点分类
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "知识点分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Knowledge knowledge)
    {
        knowledge.setUpdateBy(getUsername());
        knowledge.setUpdateTime(DateUtils.getNowDate());
        return toAjax(knowledgeService.updateById(knowledge));
    }

    /**
     * 删除知识点分类
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "知识点分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(knowledgeService.removeByIds(idList));
    }
}

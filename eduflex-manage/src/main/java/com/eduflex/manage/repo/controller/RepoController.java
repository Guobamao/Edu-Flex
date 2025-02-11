package com.eduflex.manage.repo.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.manage.repo.domain.dto.RepoDto;
import com.eduflex.manage.repo.domain.vo.RepoVo;
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
import com.eduflex.manage.repo.domain.Repo;
import com.eduflex.manage.repo.service.IRepoService;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.common.core.page.TableDataInfo;

/**
 * 题库管理Controller
 *
 * @author 林煜鋒
 * @date 2025-02-09
 */
@RestController
@RequestMapping("/manage/repo")
public class RepoController extends BaseController {
    @Autowired
    private IRepoService repoService;

    /**
     * 查询题库管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:list')")
    @GetMapping("/list")
    public TableDataInfo list(RepoDto repo) {
        startPage();
        List<RepoVo> list = repoService.selectRepoList(repo);
        return getDataTable(list);
    }

    /**
     * 导出题库管理列表
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:export')")
    @Log(title = "题库管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RepoDto repo) {
        List<RepoVo> list = repoService.selectRepoList(repo);
        ExcelUtil<RepoVo> util = new ExcelUtil<>(RepoVo.class);
        util.exportExcel(response, list, "题库管理数据");
    }

    /**
     * 获取题库管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(repoService.getById(id));
    }

    /**
     * 新增题库管理
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:add')")
    @Log(title = "题库管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Repo repo) {
        repo.setCreateBy(getUsername());
        repo.setCreateTime(DateUtils.getNowDate());
        return toAjax(repoService.save(repo));
    }

    /**
     * 修改题库管理
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:edit')")
    @Log(title = "题库管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Repo repo) {
        repo.setUpdateBy(getUsername());
        repo.setUpdateTime(DateUtils.getNowDate());
        return toAjax(repoService.updateById(repo));
    }

    /**
     * 删除题库管理
     */
    @PreAuthorize("@ss.hasPermi('manage:repo:remove')")
    @Log(title = "题库管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(repoService.removeByIds(idList));
    }
}

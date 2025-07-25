package com.eduflex.manage.question.controller;

import cn.hutool.core.collection.CollUtil;
import com.eduflex.common.annotation.Log;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.common.enums.BusinessType;
import com.eduflex.common.utils.poi.ExcelUtil;
import com.eduflex.manage.question.domain.Question;
import com.eduflex.manage.question.domain.vo.QuestionExportAndImportVo;
import com.eduflex.manage.question.domain.vo.QuestionVo;
import com.eduflex.manage.question.service.IQuestionService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 题目管理Controller
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/manage/question")
public class QuestionController extends BaseController {

    @Autowired
    private IQuestionService examQuestionService;

    /**
     * 查询题目管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping("/list")
    public TableDataInfo list(Question question) {
        startPage();
        PageInfo<Question> pageInfo = new PageInfo<>(examQuestionService.selectExamQuestionList(question));
        List<QuestionVo> list = examQuestionService.buildVo(pageInfo.getList());
        return getDataTable(list, pageInfo.getTotal());
    }

    /**
     * 导出题目管理列表
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Question question) {
        List<QuestionExportAndImportVo> list = examQuestionService.buildExportVo(examQuestionService.selectExamQuestionList(question));
        ExcelUtil<QuestionExportAndImportVo> util = new ExcelUtil<>(QuestionExportAndImportVo.class);
        util.exportExcel(response, list, "题目管理数据");
    }

    /**
     * 下载导入模板
     *
     * @param response 响应对象
     */
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) {
        ExcelUtil<QuestionExportAndImportVo> util = new ExcelUtil<>(QuestionExportAndImportVo.class);
        util.importTemplateExcel(response, "题目数据");
    }

    /**
     * 导入题目数据
     *
     * @param file   上传文件
     * @param repoId 题库id
     * @return 结果
     * @throws Exception 异常
     */
    @Log(title = "题目管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, Long repoId) throws Exception {
        ExcelUtil<QuestionExportAndImportVo> util = new ExcelUtil<>(QuestionExportAndImportVo.class);
        List<QuestionExportAndImportVo> questionList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = examQuestionService.importData(questionList, repoId, operName);
        return success(message);
    }


    /**
     * 获取题目管理详细信息
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(examQuestionService.getById(id));
    }

    /**
     * 新增题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Question question) {
        question.setCreateBy(getUsername());
        return toAjax(examQuestionService.save(question));
    }

    /**
     * 修改题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Question question) {
        question.setUpdateBy(getUsername());
        return toAjax(examQuestionService.updateById(question));
    }

    /**
     * 删除题目管理
     */
    @PreAuthorize("@ss.hasAnyRoles('admin, teacher')")
    @Log(title = "题目管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        List<Long> idList = CollUtil.toList(ids);
        return toAjax(examQuestionService.removeByIds(idList));
    }
}

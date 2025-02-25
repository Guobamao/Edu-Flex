package com.eduflex.user.evaluation.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.service.IEvaluationService;
import com.eduflex.user.evaluation.domain.vo.EvaluationVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户端 - 课程评价 控制器
 */
@RestController(value = "UserEvaluationController")
@RequestMapping("/user/evaluation")
public class EvaluationController extends BaseController {

    @Autowired
    private IEvaluationService evaluationService;

    /**
     * 课程评价列表 - 用户端
     * @param evaluation 查询条件
     * @return 课程评价列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Evaluation evaluation) {
        startPage();
        PageInfo<Evaluation> pageInfo = new PageInfo<>(evaluationService.selectEvaluationList(evaluation));
        List<EvaluationVo> evaluationVoList = evaluationService.buildVo(pageInfo.getList());
        return getDataTable(evaluationVoList, pageInfo.getTotal());
    }

    /**
     * 用户新增课程评价
     * @param evaluation 课程评价信息
     * @return 结果
     */
    @PostMapping
    public AjaxResult save(@RequestBody Evaluation evaluation) {
        evaluation.setUserId(getUserId());
        evaluation.setCreateBy(getUsername());
        return toAjax(evaluationService.saveEvaluation(evaluation));
    }
}

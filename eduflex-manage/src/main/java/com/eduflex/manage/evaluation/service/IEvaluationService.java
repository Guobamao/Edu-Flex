package com.eduflex.manage.evaluation.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.evaluation.domain.Evaluation;
import com.eduflex.manage.evaluation.domain.vo.EvaluationStatistics;
import com.eduflex.manage.evaluation.domain.vo.EvaluationVo;
import com.eduflex.user.evaluation.domain.vo.UserEvaluationVo;

import java.util.List;

/**
 * 课程评价管理 Service接口
 *
 * @author 林煜鋒
 * @date 2025-02-25
 */
public interface IEvaluationService extends IService<Evaluation> {

    /**
     * 查询课程评价管理列表
     *
     * @param evaluation 课程评价管理
     * @return 课程评价管理集合
     */
    List<Evaluation> selectEvaluationList(Evaluation evaluation);

    /**
     * 构建课程评价Vo对象
     *
     * @param list 课程评价集合
     * @return 课程评价集合Vo
     */
    List<EvaluationVo> buildVo(List<Evaluation> list);

    /**
     * 构建课程评价Vo对象
     *
     * @param evaluationList 课程评价集合
     * @return 课程评价Vo集合
     */
    List<UserEvaluationVo> buildUserVo(List<Evaluation> evaluationList);

    /**
     * 保存课程评价
     *
     * @param evaluation 课程评价
     * @return 结果
     */
    int saveEvaluation(Evaluation evaluation);

    /**
     * 课程评价统计
     *
     * @param courseId 课程ID
     * @return 课程评价统计
     */
    EvaluationStatistics statistics(Long courseId);
}

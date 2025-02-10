package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.Question;
import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.domain.vo.QuestionVo;

/**
 * 题目管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IQuestionService extends IService<Question> {
    /**
     * 查询题目管理列表
     *
     * @param question 题目管理
     * @return 题目管理集合
     */
    List<QuestionVo> selectExamQuestionList(Question question);

    /**
     * 查询题目数量
     *
     * @param repoId 关联题库ID
     * @param type   题目类型
     * @return 数量
     */
    Integer getQuestionCount(Long repoId, Integer type);
}

package com.eduflex.manage.question.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.question.domain.Question;
import com.eduflex.manage.question.domain.vo.QuestionExportAndImportVo;
import com.eduflex.manage.question.domain.vo.QuestionVo;

import java.util.List;

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
    List<Question> selectExamQuestionList(Question question);

    /**
     * 查询题目数量
     *
     * @param repoId 关联题库ID
     * @param type   题目类型
     * @return 数量
     */
    Integer getQuestionCount(Long repoId, Integer type);

    /**
     * 构建题目集合Vo对象
     *
     * @param questionList 题目集合
     * @return 题目集合Vo对象
     */
    List<QuestionVo> buildVo(List<Question> questionList);

    /**
     * 构建导出Vo对象
     *
     * @param questions 题目集合
     * @return 题目集合Vo对象
     */
    List<QuestionExportAndImportVo> buildExportVo(List<Question> questions);

    /**
     * 导入题目数据
     *
     * @param questionList 导入题目数据集合
     * @param repoId       关联题库ID
     * @param operName     操作人员
     * @return 结果
     */
    String importData(List<QuestionExportAndImportVo> questionList, Long repoId, String operName);
}

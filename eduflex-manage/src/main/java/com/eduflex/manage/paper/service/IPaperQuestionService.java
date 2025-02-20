package com.eduflex.manage.paper.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eduflex.manage.paper.domain.PaperQuestion;
import com.eduflex.manage.paper.domain.vo.PaperQuestionVo;

import java.util.List;
import java.util.Map;

/**
 * 试卷题目 Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-20
 */
public interface IPaperQuestionService extends IService<PaperQuestion> {
    Map<Integer, List<PaperQuestionVo>> selectQuestionByPaperId(Long id);

}

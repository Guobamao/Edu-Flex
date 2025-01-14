package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.Knowledge;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 知识点分类Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
public interface IKnowledgeService extends IService<Knowledge> {

    /**
     * 查询知识点分类列表
     *
     * @param knowledge 知识点分类
     * @return 知识点分类集合
     */
    List<Knowledge> selectKnowledgeList(Knowledge knowledge);

    /**
     * 新增知识点
     * @param knowledge 知识点
     * @return
     */
    int insertKnowledge(Knowledge knowledge);
}

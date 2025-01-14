package com.eduflex.manage.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.KnowledgeMapper;
import com.eduflex.manage.domain.Knowledge;
import com.eduflex.manage.service.IKnowledgeService;

/**
 * 知识点分类Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-10
 */
@Service
public class KnowledgeServiceImpl extends ServiceImpl<KnowledgeMapper, Knowledge> implements IKnowledgeService {

    @Override
    public List<Knowledge> selectKnowledgeList(Knowledge knowledge) {
        LambdaQueryWrapper<Knowledge> wrapper = new LambdaQueryWrapper<Knowledge>()
                .eq(knowledge.getCourseId() != null, Knowledge::getCourseId, knowledge.getCourseId())
                .like(StrUtil.isNotBlank(knowledge.getName()), Knowledge::getName, knowledge.getName());

        return buildTree(baseMapper.selectList(wrapper));
    }

    @Override
    public int insertKnowledge(Knowledge knowledge) {
        Knowledge info = baseMapper.selectById(knowledge.getParentId());
        if (info != null) {
            knowledge.setAncestors(info.getAncestors() + "," + knowledge.getParentId());
        } else {
            knowledge.setAncestors("0");
        }
        return baseMapper.insert(knowledge);
    }

    private List<Knowledge> buildTree(List<Knowledge> knowledgeList) {
        Map<Long, Knowledge> idMap = knowledgeList.stream()
                .collect(Collectors.toMap(Knowledge::getId, knowledge -> knowledge));

        List<Knowledge> tree = new ArrayList<>();

        for (Knowledge knowledge : knowledgeList) {
            Long parentId = knowledge.getParentId();
            if (parentId == 0) {
                // 根节点直接放入树中
                tree.add(knowledge);
            } else {
                // 子节点加入父节点的 children 列表
                Knowledge parent = idMap.get(parentId);
                if (parent != null) {
                    if (parent.getChildren() == null) {
                        parent.setChildren(new ArrayList<>());
                    }
                    parent.getChildren().add(knowledge);
                }
            }
        }
        return tree;
    }
}

package com.eduflex.manage.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;

import com.eduflex.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.LearningRouteRecordMapper;
import com.eduflex.manage.domain.LearningRouteRecord;
import com.eduflex.manage.service.ILearningRouteRecordService;

/**
 * 学习路线记录管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
@Service
public class LearningRouteRecordServiceImpl extends ServiceImpl<LearningRouteRecordMapper, LearningRouteRecord> implements ILearningRouteRecordService {
    @Autowired
    private LearningRouteRecordMapper learningRouteRecordMapper;

    /**
     * 查询学习路线记录管理
     *
     * @param id 学习路线记录管理主键
     * @return 学习路线记录管理
     */
    @Override
    public LearningRouteRecord selectLearningRouteRecordById(Long id) {
        return learningRouteRecordMapper.selectLearningRouteRecordById(id);
    }

    /**
     * 查询学习路线记录管理列表
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 学习路线记录管理
     */
    @Override
    public List<LearningRouteRecord> selectLearningRouteRecordList(LearningRouteRecord learningRouteRecord) {
        return learningRouteRecordMapper.selectLearningRouteRecordList(learningRouteRecord);
    }

    /**
     * 新增学习路线记录管理
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 结果
     */
    @Override
    public int insertLearningRouteRecord(LearningRouteRecord learningRouteRecord) {
                learningRouteRecord.setCreateTime(DateUtils.getNowDate());
            return learningRouteRecordMapper.insertLearningRouteRecord(learningRouteRecord);
    }

    /**
     * 修改学习路线记录管理
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 结果
     */
    @Override
    public int updateLearningRouteRecord(LearningRouteRecord learningRouteRecord) {
                learningRouteRecord.setUpdateTime(DateUtils.getNowDate());
        return learningRouteRecordMapper.updateLearningRouteRecord(learningRouteRecord);
    }

    /**
     * 批量删除学习路线记录管理
     *
     * @param ids 需要删除的学习路线记录管理主键
     * @return 结果
     */
    @Override
    public int deleteLearningRouteRecordByIds(Long[] ids) {
        return learningRouteRecordMapper.deleteLearningRouteRecordByIds(ids);
    }

    /**
     * 删除学习路线记录管理信息
     *
     * @param id 学习路线记录管理主键
     * @return 结果
     */
    @Override
    public int deleteLearningRouteRecordById(Long id) {
        return learningRouteRecordMapper.deleteLearningRouteRecordById(id);
    }
}

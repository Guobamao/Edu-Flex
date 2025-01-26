package com.eduflex.manage.service;

import java.util.List;
import com.eduflex.manage.domain.LearningRouteRecord;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 学习路线记录管理Service接口
 *
 * @author 林煜鋒
 * @date 2025-01-24
 */
public interface ILearningRouteRecordService extends IService<LearningRouteRecord> {
    /**
     * 查询学习路线记录管理
     *
     * @param id 学习路线记录管理主键
     * @return 学习路线记录管理
     */
    public LearningRouteRecord selectLearningRouteRecordById(Long id);

    /**
     * 查询学习路线记录管理列表
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 学习路线记录管理集合
     */
    public List<LearningRouteRecord> selectLearningRouteRecordList(LearningRouteRecord learningRouteRecord);

    /**
     * 新增学习路线记录管理
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 结果
     */
    public int insertLearningRouteRecord(LearningRouteRecord learningRouteRecord);

    /**
     * 修改学习路线记录管理
     *
     * @param learningRouteRecord 学习路线记录管理
     * @return 结果
     */
    public int updateLearningRouteRecord(LearningRouteRecord learningRouteRecord);

    /**
     * 批量删除学习路线记录管理
     *
     * @param ids 需要删除的学习路线记录管理主键集合
     * @return 结果
     */
    public int deleteLearningRouteRecordByIds(Long[] ids);

    /**
     * 删除学习路线记录管理信息
     *
     * @param id 学习路线记录管理主键
     * @return 结果
     */
    public int deleteLearningRouteRecordById(Long id);
}
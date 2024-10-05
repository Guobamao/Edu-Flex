package com.eduflex.manage.service.impl;

import java.util.List;

import com.eduflex.common.constant.UserConstants;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.mapper.CollegeMapper;
import com.eduflex.manage.domain.College;
import com.eduflex.manage.service.ICollegeService;

/**
 * 学院管理Service业务层处理
 * 
 * @author 林煜鋒
 * @date 2024-10-05
 */
@Service
public class CollegeServiceImpl implements ICollegeService 
{
    @Autowired
    private CollegeMapper collegeMapper;

    /**
     * 查询学院管理
     * 
     * @param id 学院管理主键
     * @return 学院管理
     */
    @Override
    public College selectCollegeById(Long id)
    {
        return collegeMapper.selectCollegeById(id);
    }

    /**
     * 查询学院管理列表
     * 
     * @param college 学院管理
     * @return 学院管理
     */
    @Override
    public List<College> selectCollegeList(College college)
    {
        return collegeMapper.selectCollegeList(college);
    }

    /**
     * 新增学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    @Override
    public int insertCollege(College college)
    {
        College info = collegeMapper.selectCollegeById(college.getParentId());
        college.setAncestors(info.getAncestors() + "," + college.getParentId());
        college.setCreateTime(DateUtils.getNowDate());
        return collegeMapper.insertCollege(college);
    }

    /**
     * 修改学院管理
     * 
     * @param college 学院管理
     * @return 结果
     */
    @Override
    public int updateCollege(College college)
    {
        college.setUpdateTime(DateUtils.getNowDate());
        return collegeMapper.updateCollege(college);
    }

    /**
     * 删除学院管理信息
     * 
     * @param collegeId 学院管理主键
     * @return 结果
     */
    @Override
    public int deleteCollegeByCollegeId(Long collegeId)
    {
        return collegeMapper.deleteCollegeByCollegeId(collegeId);
    }

    /**
     * 检验学院名称唯一性
     * @param college
     * @return
     */
    @Override
    public boolean checkCollegeNameUnique(College college) {
        long collegeId = StringUtils.isNull(college.getId()) ? -1L : college.getId();
        College info = collegeMapper.checkCollegeNameUnique(college.getName(), college.getParentId());
        if (StringUtils.isNotNull(info) && info.getId() != collegeId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 检验学院是否有子学院
     * @param collegeId 学院ID
     * @return
     */
    @Override
    public boolean hasChildByCollegeId(Long collegeId) {
        int result = collegeMapper.hasChildByCollegeId(collegeId);
        return result > 0;
    }
}

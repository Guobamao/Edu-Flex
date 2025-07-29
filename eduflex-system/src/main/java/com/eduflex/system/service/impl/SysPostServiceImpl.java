package com.eduflex.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.UserConstants;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.StringUtils;
import com.eduflex.system.domain.SysPost;
import com.eduflex.system.mapper.SysPostMapper;
import com.eduflex.system.mapper.SysUserPostMapper;
import com.eduflex.system.service.ISysPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 岗位信息 服务层处理
 *
 * @author ruoyi
 */
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements ISysPostService {

    @Autowired
    private SysUserPostMapper userPostMapper;

    @Override
    public List<SysPost> selectPostList(SysPost post) {
        LambdaQueryWrapper<SysPost> wrapper = Wrappers.<SysPost>lambdaQuery()
                .like(StrUtil.isNotBlank(post.getPostCode()), SysPost::getPostCode, post.getPostCode())
                .eq(post.getStatus() != null, SysPost::getStatus, post.getStatus())
                .like(StrUtil.isNotBlank(post.getPostName()), SysPost::getPostName, post.getPostName());
        return list(wrapper);
    }

    @Override
    public List<Long> selectPostListByUserId(Long userId) {
        return baseMapper.selectPostListByUserId(userId);
    }

    @Override
    public List<SysPost> selectPostsByUserName(String userName) {
        return baseMapper.selectPostsByUserName(userName);
    }

    @Override
    public boolean checkPostNameUnique(SysPost post) {
        long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
        LambdaQueryWrapper<SysPost> wrapper = Wrappers.<SysPost>lambdaQuery()
                .eq(SysPost::getPostName, post.getPostName())
                .last("limit 1");
        SysPost info = getOne(wrapper);
        if (StringUtils.isNotNull(info) && info.getPostId() != postId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    public boolean checkPostCodeUnique(SysPost post) {
        long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
        LambdaQueryWrapper<SysPost> wrapper = Wrappers.<SysPost>lambdaQuery()
                .eq(SysPost::getPostCode, post.getPostCode())
                .last("limit 1");
        SysPost info = getOne(wrapper);
        if (StringUtils.isNotNull(info) && info.getPostId() != postId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    public int countUserPostById(Long postId) {
        return userPostMapper.countUserPostById(postId);
    }

    @Override
    @Transactional
    public boolean deletePostByIds(List<Long> postIds) {
        for (Long postId : postIds) {
            SysPost post = getById(postId);
            if (countUserPostById(postId) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", post.getPostName()));
            }
        }
        return removeBatchByIds(postIds);
    }
}

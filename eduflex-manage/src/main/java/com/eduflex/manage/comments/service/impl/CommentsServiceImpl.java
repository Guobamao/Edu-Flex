package com.eduflex.manage.comments.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.manage.comments.mapper.CommentsMapper;
import com.eduflex.manage.comments.service.ICommentsService;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.comment.domain.vo.UserCommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 评论管理Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
@Service
public class CommentsServiceImpl extends ServiceImpl<CommentsMapper, Comments> implements ICommentsService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ISysUserService sysUserService;

    @Override
    public List<Comments> selectCommentsList(Comments comments) {
        LambdaQueryWrapper<Comments> wrapper = new LambdaQueryWrapper<Comments>()
                .eq(comments.getCourseId() != null, Comments::getCourseId, comments.getCourseId())
                .eq(comments.getUserId() != null, Comments::getUserId, comments.getUserId())
                .eq(comments.getParentId() != null, Comments::getParentId, comments.getParentId())
                .like(comments.getContent() != null, Comments::getContent, comments.getContent());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<CommentsVo> buildVo(List<Comments> commentsList) {
        List<CommentsVo> commentsVos = new ArrayList<>();

        for (Comments comments : commentsList) {
            CommentsVo commentsVo = new CommentsVo();
            BeanUtil.copyProperties(comments, commentsVo);

            commentsVo.setCourseName(courseService.getById(comments.getCourseId()).getName());

            SysUser sysUser = sysUserService.selectUserById(comments.getUserId());
            commentsVo.setAvatar(sysUser.getAvatar());
            commentsVo.setNickName(sysUser.getNickName());
            commentsVo.setUserName(sysUser.getUserName());

            commentsVos.add(commentsVo);
        }
        return commentsVos;
    }

    @Override
    public List<Comments> selectUserCommentsList(Comments comments) {
        LambdaQueryWrapper<Comments> wrapper = new LambdaQueryWrapper<Comments>()
                .eq(comments.getCourseId() != null, Comments::getCourseId, comments.getCourseId())
                .eq(comments.getUserId() != null, Comments::getUserId, comments.getUserId());
        if (comments.getParentId() != null) {
            wrapper.eq(Comments::getParentId, comments.getParentId());
        } else {
            wrapper.eq(Comments::getParentId, 0);
        }
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<UserCommentVo> buildUserVo(List<Comments> list) {
        List<UserCommentVo> userCommentVos = new ArrayList<>();
        for (Comments comments : list) {
            UserCommentVo userCommentVo = new UserCommentVo();
            BeanUtil.copyProperties(comments, userCommentVo);

            userCommentVo.setCourseName(courseService.getById(comments.getCourseId()).getName());
            SysUser sysUser = sysUserService.selectUserById(comments.getUserId());
            userCommentVo.setAvatar(sysUser.getAvatar());
            userCommentVo.setNickName(sysUser.getNickName());
            userCommentVo.setUserName(sysUser.getUserName());

            userCommentVos.add(userCommentVo);
        }
        return userCommentVos;
    }
}

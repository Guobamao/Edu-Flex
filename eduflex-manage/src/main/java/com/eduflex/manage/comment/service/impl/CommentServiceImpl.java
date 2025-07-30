package com.eduflex.manage.comment.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.utils.spring.SpringUtils;
import com.eduflex.manage.comment.domain.Comment;
import com.eduflex.manage.comment.domain.vo.CommentVo;
import com.eduflex.manage.comment.mapper.CommentMapper;
import com.eduflex.manage.comment.service.ICommentService;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.comment.domain.vo.UserCommentVo;
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
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

    @Override
    public List<Comment> selectCommentsList(Comment comment) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<Comment>()
                .eq(comment.getCourseId() != null, Comment::getCourseId, comment.getCourseId())
                .eq(comment.getUserId() != null, Comment::getUserId, comment.getUserId())
                .eq(comment.getParentId() != null, Comment::getParentId, comment.getParentId())
                .like(comment.getContent() != null, Comment::getContent, comment.getContent());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<CommentVo> buildVo(List<Comment> commentList) {
        ICourseService courseService = SpringUtils.getBean(ICourseService.class);
        ISysUserService userService = SpringUtils.getBean(ISysUserService.class);

        List<CommentVo> commentsVos = new ArrayList<>();

        for (Comment comment : commentList) {
            CommentVo commentsVo = new CommentVo();
            BeanUtil.copyProperties(comment, commentsVo);

            commentsVo.setCourseName(courseService.getById(comment.getCourseId()).getName());

            SysUser sysUser = userService.selectUserById(comment.getUserId());
            commentsVo.setAvatar(sysUser.getAvatar());
            commentsVo.setNickName(sysUser.getNickName());
            commentsVo.setUserName(sysUser.getUserName());

            commentsVos.add(commentsVo);
        }
        return commentsVos;
    }

    @Override
    public List<Comment> selectUserCommentsList(Comment comment) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<Comment>()
                .eq(comment.getCourseId() != null, Comment::getCourseId, comment.getCourseId())
                .eq(comment.getUserId() != null, Comment::getUserId, comment.getUserId());
        if (comment.getParentId() != null) {
            wrapper.eq(Comment::getParentId, comment.getParentId());
        } else {
            wrapper.eq(Comment::getParentId, 0);
        }
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<UserCommentVo> buildUserVo(List<Comment> list) {
        ICourseService courseService = SpringUtils.getBean(ICourseService.class);
        ISysUserService userService = SpringUtils.getBean(ISysUserService.class);

        List<UserCommentVo> userCommentVos = new ArrayList<>();
        for (Comment comment : list) {
            UserCommentVo userCommentVo = new UserCommentVo();
            BeanUtil.copyProperties(comment, userCommentVo);

            userCommentVo.setCourseName(courseService.getById(comment.getCourseId()).getName());
            SysUser sysUser = userService.selectUserById(comment.getUserId());
            userCommentVo.setAvatar(sysUser.getAvatar());
            userCommentVo.setNickName(sysUser.getNickName());
            userCommentVo.setUserName(sysUser.getUserName());

            userCommentVos.add(userCommentVo);
        }
        return userCommentVos;
    }
}

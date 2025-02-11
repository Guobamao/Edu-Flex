package com.eduflex.manage.comments.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import com.eduflex.manage.comments.domain.vo.CommentsVo;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eduflex.manage.comments.mapper.CommentsMapper;
import com.eduflex.manage.comments.domain.Comments;
import com.eduflex.manage.comments.service.ICommentsService;

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
    public List<CommentsVo> selectCommentsList(Comments comments) {
        LambdaQueryWrapper<Comments> wrapper = new LambdaQueryWrapper<Comments>()
                .eq(comments.getCourseId() != null, Comments::getCourseId, comments.getCourseId())
                .eq(comments.getUserId() != null, Comments::getUserId, comments.getUserId())
                .eq(comments.getParentId() != null, Comments::getParentId, comments.getParentId())
                .like(comments.getContent() != null, Comments::getContent, comments.getContent());

        List<Comments> commentsList = baseMapper.selectList(wrapper);

        return buildVo(commentsList);
    }

    private List<CommentsVo> buildVo(List<Comments> commentsList) {
        List<CommentsVo> commentsVos = new ArrayList<>();

        for (Comments comments : commentsList) {
            CommentsVo commentsVo = new CommentsVo();
            BeanUtil.copyProperties(comments, commentsVo);

           commentsVo.setCourseName(courseService.getById(comments.getCourseId()).getName());
           commentsVo.setUserName(sysUserService.selectUserById(comments.getUserId()).getUserName());
           commentsVo.setNickName(sysUserService.selectUserById(comments.getUserId()).getNickName());

           commentsVos.add(commentsVo);
        }
        return commentsVos;
    }
}

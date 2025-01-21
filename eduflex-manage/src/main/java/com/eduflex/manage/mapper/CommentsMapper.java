package com.eduflex.manage.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.Comments;
import org.apache.ibatis.annotations.Param;

/**
 * 评论管理Mapper接口
 *
 * @author 林煜鋒
 * @date 2025-01-21
 */
public interface CommentsMapper extends BaseMapper<Comments> {
}

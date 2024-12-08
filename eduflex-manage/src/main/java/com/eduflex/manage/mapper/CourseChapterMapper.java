package com.eduflex.manage.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eduflex.manage.domain.CourseChapter;

/**
 * 课程内容章节管理Mapper接口
 * 
 * @author 林煜鋒
 * @date 2024-10-14
 */
public interface CourseChapterMapper extends BaseMapper<CourseChapter>
{
    int selectMaxOrderNum(Long parentId);}

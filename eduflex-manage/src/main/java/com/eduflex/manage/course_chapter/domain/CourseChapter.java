package com.eduflex.manage.course_chapter.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.eduflex.common.annotation.Excel;
import com.eduflex.common.core.domain.TreeEntity;

/**
 * 课程内容章节管理对象 tb_course_chapter
 *
 * @author 林煜鋒
 * @date 2024-10-14
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("tb_course_chapter")
public class CourseChapter extends TreeEntity<CourseChapter>
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 关联课程ID */
    private Long courseId;

    /** 章节名称 */
    @Excel(name = "章节名称")
    private String name;
}

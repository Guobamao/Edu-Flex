package com.eduflex.user.course_material.domain.vo;

import com.eduflex.manage.course_material.domain.CourseMaterial;
import lombok.Data;

@Data
public class CourseMaterialVo extends CourseMaterial {
    // 课程ID
    private Long courseId;
    // 课程名称
    private String courseName;
    // 章节名称
    private String chapterName;
    // 学习状态（0-未开始 1-进行中 2-已完成）
    private Integer status;
    // 音视频上次播放进度（秒）
    private Integer lastPosition;
    // 课程进度百分比 0-100
    private Integer progress;
}

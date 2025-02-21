package com.eduflex.user.study_record.domain.dto;

import lombok.Data;

/**
 * 上传学习记录Dto
 */
@Data
public class StudyRecordDto {
    // 用户ID
    private Long userId;
    // 课程ID
    private Long courseId;
    // 章节ID
    private Long chapterId;
    // 资料ID
    private Long materialId;
    // 学习时长
    private Integer duration;
    // 音视频上次播放进度
    private Integer lastPosition;
    // 图片当前序号(0开始）
    private Integer picIndex;
    // 图片最大页码 / 音视频时长
    private Integer maxDuration;

    // 资料类型
    private Integer materialType;
}

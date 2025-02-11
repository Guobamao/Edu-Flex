package com.eduflex.manage.paper.domain.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class PaperQuestionDto {
    private Long id;
    // 题目 Map
    private Map<Integer, List<Long>> questionMap;
}

package com.eduflex.manage.domain.dto;

import lombok.Data;

import java.util.List;

@Data
public class PaperDto {
    /** 试卷ID */
    private Long id;

    /** 题库信息 */
    private List<RepoInfo> repoInfos;
}

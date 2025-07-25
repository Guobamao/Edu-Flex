package com.eduflex.manage.evaluation.domain.vo;

import lombok.Data;

/**
 * 评价统计
 *
 * @author 林煜鋒
 */
@Data
public class EvaluationStatistics {
    // 总评价
    private Integer totalNum;
    // 一星
    private Integer oneStarNum;
    // 二星
    private Integer twoStarNum;
    // 三星
    private Integer threeStarNum;
    // 四星
    private Integer fourStarNum;
    // 五星
    private Integer fiveStarNum;
}

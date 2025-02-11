package com.eduflex.manage.paper.domain.vo;

import com.eduflex.manage.paper.domain.PaperRepo;
import lombok.Data;

@Data
public class PaperRepoVo extends PaperRepo {
    private Integer singleChoiceTotal;
    private Integer multipleChoiceTotal;
    private Integer judgeTotal;
    private Integer blankTotal;
    private Integer shortAnswerTotal;
}

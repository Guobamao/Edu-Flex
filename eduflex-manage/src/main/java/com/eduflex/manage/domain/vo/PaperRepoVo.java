package com.eduflex.manage.domain.vo;

import com.eduflex.manage.domain.PaperRepo;
import lombok.Data;

@Data
public class PaperRepoVo extends PaperRepo {
    private Integer singleChoiceTotal;
    private Integer multipleChoiceTotal;
    private Integer judgeTotal;
    private Integer blankTotal;
    private Integer shortAnswerTotal;
}

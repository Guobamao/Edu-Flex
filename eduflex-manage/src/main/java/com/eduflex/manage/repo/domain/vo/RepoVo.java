package com.eduflex.manage.repo.domain.vo;

import com.eduflex.common.annotation.Excel;
import com.eduflex.manage.repo.domain.Repo;
import lombok.Data;

@Data
public class RepoVo extends Repo {
    @Excel(name = "课程名称", sort = 1)
    private String courseName;

    @Excel(name = "单选题数量", sort = 3)
    // 单选题数量
    private Integer singleChoiceCount;
    @Excel(name = "多选题数量", sort = 4)
    // 多选题数量
    private Integer multipleChoiceCount;
    @Excel(name = "判断题数量", sort = 5)
    // 判断题数量
    private Integer judgeCount;
    @Excel(name = "填空题数量", sort = 6)
    // 填空题数量
    private Integer blankCount;
    @Excel(name = "简答题数量", sort = 7)
    // 简答题数量
    private Integer shortAnswerCount;
}

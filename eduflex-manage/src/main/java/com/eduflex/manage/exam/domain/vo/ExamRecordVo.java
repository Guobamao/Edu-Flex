package com.eduflex.manage.exam.domain.vo;

import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.user.exam.domain.vo.PaperQuestionVo;
import lombok.Data;

import java.util.List;

@Data
public class ExamRecordVo extends ExamRecord {
    private String userName;
    private String nickName;
    private String examName;

    // 考试剩余时间（秒）
    private Integer leftSeconds;

    // 单选题题目
    private List<PaperQuestionVo> singleChoiceQuestionList;
    // 多选题题目
    private List<PaperQuestionVo> multipleChoiceQuestionList;
    // 判断题题目
    private List<PaperQuestionVo> judgeQuestionList;
    // 填空题题目
    private List<PaperQuestionVo> fillQuestionList;
    // 简答题题目
    private List<PaperQuestionVo> shortAnswerQuestionList;

    // 已做题目答案
    private List<ExamAnswer> examAnswerList;
}

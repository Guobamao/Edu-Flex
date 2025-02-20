package com.eduflex.manage.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.utils.DateUtils;
import com.eduflex.common.utils.bean.BeanUtils;
import com.eduflex.manage.course.service.ICourseService;
import com.eduflex.manage.exam.domain.Exam;
import com.eduflex.manage.exam.domain.ExamAnswer;
import com.eduflex.manage.exam.domain.ExamRecord;
import com.eduflex.manage.exam.domain.dto.ExamRecordDto;
import com.eduflex.manage.exam.domain.vo.ExamRecordVo;
import com.eduflex.manage.exam.mapper.ExamRecordMapper;
import com.eduflex.manage.exam.service.IExamAnswerService;
import com.eduflex.manage.exam.service.IExamRecordService;
import com.eduflex.manage.exam.service.IExamService;
import com.eduflex.manage.paper.domain.vo.PaperQuestionVo;
import com.eduflex.manage.paper.service.IPaperQuestionService;
import com.eduflex.manage.student.domain.dto.StudentCourseDto;
import com.eduflex.manage.student.domain.dto.StudentDto;
import com.eduflex.manage.student.domain.vo.StudentCourseVo;
import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.student.service.IStudentCourseService;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.quartz.service.ISysJobService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 考试记录Service业务层处理
 *
 * @author 林煜鋒
 * @date 2025-02-11
 */
@Service
public class ExamRecordServiceImpl extends ServiceImpl<ExamRecordMapper, ExamRecord> implements IExamRecordService {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IExamService examService;

    @Autowired
    private IStudentCourseService studentCourseService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ISysJobService jobService;

    @Autowired
    private IPaperQuestionService paperQuestionService;

    @Autowired
    private IExamAnswerService examAnswerService;

    @Override
    public List<ExamRecordVo> selectExamRecordList(ExamRecordDto examRecord) {

        StudentDto studentDto = new StudentDto();
        studentDto.setSearchValue(examRecord.getSearchValue());

        List<Long> userIdList = studentService.selectStudentList(studentDto).stream().map(StudentVo::getUserId).toList();

        if (userIdList.isEmpty()) {
            return Collections.emptyList();
        }
        LambdaQueryWrapper<ExamRecord> wrapper = new LambdaQueryWrapper<ExamRecord>()
                .eq(examRecord.getExamId() != null, ExamRecord::getExamId, examRecord.getExamId())
                .eq(examRecord.getStatus() != null, ExamRecord::getStatus, examRecord.getStatus())
                .eq(examRecord.getPassed() != null, ExamRecord::getPassed, examRecord.getPassed())
                .in(ExamRecord::getUserId, userIdList);

        return buildVo(baseMapper.selectList(wrapper));
    }

    @Override
    public ExamRecordVo selectExamRecordById(Long id) {
        ExamRecord examRecord = baseMapper.selectById(id);
        return buildVo(examRecord);
    }

    @Override
    public List<ExamVo> selectExamRecordList(ExamDto examDto) {
        // 获取学生已选课程ID
        StudentCourseDto studentCourseDto = new StudentCourseDto();
        studentCourseDto.setUserId(examDto.getUserId());

        if (examDto.getCourseId() != null) {
            studentCourseDto.setCourseId(examDto.getCourseId());
        }

        List<StudentCourseVo> studentCourseVos = studentCourseService.selectStudentCourseList(studentCourseDto);
        List<Long> courseIds = studentCourseVos.stream().map(StudentCourseVo::getCourseId).toList();

        // 查询课程下的考试
        if (!courseIds.isEmpty()) {
            LambdaQueryWrapper<Exam> examWrapper = new LambdaQueryWrapper<Exam>()
                    .in(Exam::getCourseId, courseIds)
                    .eq(Exam::getPublished, 1)
                    .orderByDesc(Exam::getCreateTime);
            List<Exam> examList = examService.list(examWrapper);

            return examList.stream().map(v -> {
                ExamVo examVo = new ExamVo();
                examVo.setExamId(v.getId());
                examVo.setExamName(v.getName());
                examVo.setCourseId(v.getCourseId());
                examVo.setTotalScore(v.getTotalScore());
                examVo.setPassScore(v.getPassScore());
                examVo.setDuration(v.getDuration());
                examVo.setCourseName(courseService.getById(v.getCourseId()).getName());
                examVo.setLimited(v.getLimited());
                // 如果试卷是限时，则需要判断时间是否已截止
                if (v.getLimited() == 1) {
                    if (DateUtils.getNowDate().before(v.getStartTime())) {
                        // 如果当前时间在考试开始时间之前，则设置考试状态为未开始
                        examVo.setStatus(0);
                    } else if (DateUtils.getNowDate().after(v.getStartTime()) && DateUtils.getNowDate().before(v.getEndTime())) {
                        // 如果当前时间在考试开始时间之后，并且在考试结束时间之前，则设置考试状态为进行中
                        examVo.setStatus(1);
                    } else if (DateUtils.getNowDate().after(v.getEndTime())) {
                        // 如果当前时间在考试结束时间之后，则设置考试状态为已结束
                        examVo.setStatus(2);
                    }

                    examVo.setStartTime(v.getStartTime());
                    examVo.setEndTime(v.getEndTime());
                } else {
                    examVo.setStatus(v.getStatus());
                }

                // 查询是否已有考试记录
                LambdaQueryWrapper<ExamRecord> wrapper = new LambdaQueryWrapper<ExamRecord>()
                        .eq(ExamRecord::getUserId, examDto.getUserId())
                        .eq(ExamRecord::getExamId, v.getId());
                ExamRecord examRecord = getOne(wrapper);
                if (examRecord != null) {
                    // 设置提交状态
                    examVo.setSubmitStatus(examRecord.getStatus());
                    examVo.setSubmitTime(examRecord.getSubmitTime());
                } else {
                    // 设置提交状态为未开始
                    examVo.setSubmitStatus(0);
                    examVo.setSubmitTime(null);
                }
                return examVo;
            }).toList();
        }
        return List.of();
    }

    @Override
    public Long createExam(ExamDto examDto) {
        LambdaQueryWrapper<ExamRecord> wrapper = new LambdaQueryWrapper<ExamRecord>()
                .eq(ExamRecord::getUserId, examDto.getUserId())
                .eq(ExamRecord::getStatus, EduFlexConstants.STATUS_IN_PROGRESS);
        if (baseMapper.selectCount(wrapper) > 0) {
            throw new ServiceException("您有正在进行的考试！");
        }

        // 查找考试
        Exam exam = examService.getById(examDto.getExamId());
        if (exam == null) {
            throw new ServiceException("考试不存在");
        }

        if (exam.getPublished().equals(EduFlexConstants.EXAM_PUBLISH_STATUS_UNPUBLISHED)) {
            throw new ServiceException("考试未发布");
        }

        if (exam.getStatus().equals(EduFlexConstants.STATUS_UNSTARTED)) {
            throw new ServiceException("考试未开始");
        }

        if (exam.getStatus().equals(EduFlexConstants.STATUS_ENDED)) {
            throw new ServiceException("考试已结束");
        }

        ExamRecord examRecord = new ExamRecord();
        examRecord.setExamId(exam.getId());
        examRecord.setPaperId(exam.getPaperId());
        examRecord.setUserId(examDto.getUserId());
        baseMapper.insert(examRecord);
        return examRecord.getId();
    }

    private ExamRecordVo buildVo(ExamRecord examRecord) {
        ExamRecordVo examRecordVo = new ExamRecordVo();
        BeanUtils.copyProperties(examRecord, examRecordVo);

        Exam exam = examService.getById(examRecord.getExamId());
        examRecordVo.setExamName(exam.getName());
        SysUser user = userService.selectUserById(examRecord.getUserId());
        examRecordVo.setUserName(user.getUserName());
        examRecordVo.setNickName(user.getNickName());

        // 计算考试剩余时间
        if (exam.getLimited() == 1) {
            // 限时考试，计算当前时间与考试结束时间的差值
            if ((examRecord.getEndTime().getTime() - System.currentTimeMillis()) / 1000 <= exam.getDuration() * 60) {
                examRecordVo.setLeftSeconds((int) ((examRecord.getEndTime().getTime() - System.currentTimeMillis()) / 1000));
            } else {
                int leftSeconds = (int) (exam.getDuration() * 60 - (System.currentTimeMillis() - examRecord.getStartTime().getTime()) / 1000);
                examRecordVo.setLeftSeconds(leftSeconds);
            }
        } else {
            // 不限时考试，则计算当前时间与考试结束时间（创建时间 + 考试时长）的差值
            long l = examRecord.getCreateTime().getTime() + exam.getDuration() * 60 * 1000;
            examRecordVo.setLeftSeconds((int) ((l - System.currentTimeMillis()) / 1000));
        }

        // 设置题目
        Map<Integer, List<PaperQuestionVo>> integerListMap = paperQuestionService.selectQuestionByPaperId(examRecord.getPaperId());
        examRecordVo.setSingleChoiceQuestionList(convertQuestionList(integerListMap.get(EduFlexConstants.SINGLE_CHOICE)));
        examRecordVo.setMultipleChoiceQuestionList(convertQuestionList(integerListMap.get(EduFlexConstants.MULTIPLE_CHOICE)));
        examRecordVo.setJudgeQuestionList(convertQuestionList(integerListMap.get(EduFlexConstants.JUDGMENT)));
        examRecordVo.setFillQuestionList(convertQuestionList(integerListMap.get(EduFlexConstants.FILL_BLANK)));
        examRecordVo.setShortAnswerQuestionList(convertQuestionList(integerListMap.get(EduFlexConstants.SHORT_ANSWER)));

        ExamAnswer examAnswer = new ExamAnswer();
        examAnswer.setRecordId(examRecord.getId());
        examRecordVo.setExamAnswerList(examAnswerService.selectExamAnswerList(examAnswer));
        return examRecordVo;
    }

    private List<ExamRecordVo> buildVo(List<ExamRecord> examRecordList) {
        List<ExamRecordVo> examRecordVoList = new ArrayList<>();
        for (ExamRecord examRecord : examRecordList) {
            ExamRecordVo examRecordVo = new ExamRecordVo();
            BeanUtils.copyProperties(examRecord, examRecordVo);
            SysUser sysUser = userService.selectUserById(examRecord.getUserId());
            examRecordVo.setUserName(sysUser.getUserName());
            examRecordVo.setNickName(sysUser.getNickName());
            examRecordVoList.add(examRecordVo);
        }
        return examRecordVoList;
    }

    private List<com.eduflex.user.exam.domain.vo.PaperQuestionVo> convertQuestionList(List<PaperQuestionVo> paperQuestionVoList) {
        List<com.eduflex.user.exam.domain.vo.PaperQuestionVo> convertedList = new ArrayList<>();
        paperQuestionVoList.forEach(paperQuestionVo -> {
            com.eduflex.user.exam.domain.vo.PaperQuestionVo questionVo = new com.eduflex.user.exam.domain.vo.PaperQuestionVo();
            BeanUtils.copyProperties(paperQuestionVo, questionVo);
            convertedList.add(questionVo);
        });
        return convertedList;
    }
}

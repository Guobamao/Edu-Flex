package com.eduflex.manage.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eduflex.common.constant.EduFlexConstants;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.exception.ServiceException;
import com.eduflex.common.exception.job.TaskException;
import com.eduflex.common.utils.CronUtils;
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
import com.eduflex.quartz.domain.SysJob;
import com.eduflex.quartz.service.ISysJobService;
import com.eduflex.system.service.ISysUserService;
import com.eduflex.user.exam.domain.dto.ExamDto;
import com.eduflex.user.exam.domain.vo.ExamVo;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import static com.eduflex.common.utils.SecurityUtils.getUsername;

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
    public Long createExam(ExamDto examDto) throws SchedulerException, TaskException {
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

        // 创建考试记录
        ExamRecord examRecord = new ExamRecord();
        examRecord.setExamId(exam.getId());
        examRecord.setPaperId(exam.getPaperId());
        examRecord.setUserId(examDto.getUserId());
        examRecord.setStatus(EduFlexConstants.STATUS_IN_PROGRESS);
        examRecord.setCreateBy(getUsername());


        // 创建强制交卷任务
        SysJob sysJob = new SysJob();
        sysJob.setJobName("强制交卷-" + examRecord.getId());
        sysJob.setJobGroup("DEFAULT");
        String cron = CronUtils.dateToCron(calculateExamEndTime(exam));
        sysJob.setCronExpression(cron);
        sysJob.setInvokeTarget("breakExamTask.ryParams(" + examRecord.getId() + "L)");
        sysJob.setStatus("0");
        sysJob.setMisfirePolicy("1");
        jobService.insertJob(sysJob);

        examRecord.setJobId(sysJob.getJobId());
        baseMapper.insert(examRecord);
        return examRecord.getId();
    }

    @Override
    public void handExam(Long recordId) throws SchedulerException {
        // 获取考试记录
        ExamRecord examRecord = baseMapper.selectById(recordId);
        if (examRecord.getStatus().equals(EduFlexConstants.STATUS_IN_PROGRESS)) {
            throw new ServiceException("考试状态不正确！");
        }

        // 获取学生考试答案记录
        ExamAnswer examAnswer = new ExamAnswer();
        examAnswer.setRecordId(recordId);
        List<ExamAnswer> examAnswers = examAnswerService.selectExamAnswerList(examAnswer);

        // 计算客观分
        Map<Integer, List<PaperQuestionVo>> integerListMap = paperQuestionService.selectQuestionByPaperId(examRecord.getPaperId());
        List<PaperQuestionVo> singleChoiceList = integerListMap.get(EduFlexConstants.SINGLE_CHOICE);
        List<PaperQuestionVo> multipleChoiceList = integerListMap.get(EduFlexConstants.MULTIPLE_CHOICE);
        List<PaperQuestionVo> judgeList = integerListMap.get(EduFlexConstants.JUDGMENT);

        int singleScore = 0;
        int multipleScore = 0;
        int judgeScore = 0;
        for (PaperQuestionVo paperQuestionVo : singleChoiceList) {
            // 获取题目ID
            Long questionId = paperQuestionVo.getId();
            for (ExamAnswer answer : examAnswers) {
                if (answer.getQuestionId().equals(questionId)) {
                    if (answer.getAnswer().equals(paperQuestionVo.getAnswer())) {
                        singleScore += paperQuestionVo.getScore();
                    }
                }
            }
        }
        for (PaperQuestionVo paperQuestionVo : multipleChoiceList) {
            // 获取题目ID
            Long questionId = paperQuestionVo.getId();
            for (ExamAnswer answer : examAnswers) {
                if (answer.getQuestionId().equals(questionId)) {
                    if (answer.getAnswer().equals(paperQuestionVo.getAnswer())) {
                        multipleScore += paperQuestionVo.getScore();
                    }
                }
            }
        }
        for (PaperQuestionVo paperQuestionVo : judgeList) {
            // 获取题目ID
            Long questionId = paperQuestionVo.getId();
            for (ExamAnswer answer : examAnswers) {
                if (answer.getQuestionId().equals(questionId)) {
                    if (answer.getAnswer().equals(paperQuestionVo.getAnswer())) {
                        judgeScore += paperQuestionVo.getScore();
                    }
                }
            }
       }

        // 设置分数为客观题分
        examRecord.setScore(singleScore + multipleScore + judgeScore);
        // 设置提交时间
        examRecord.setSubmitTime(DateUtils.getNowDate());
        examRecord.setUpdateBy("System");
        // 计算考试时长
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        int duration = (int) ((System.currentTimeMillis() - examRecord.getCreateTime().getTime()) / 1000 / 1000);
        if (duration == 0) {
            duration = 1;
        }
        examRecord.setDuration(duration);

        // 判断是否有客观题（填空题 / 简答题）
        List<PaperQuestionVo> blankList = integerListMap.get(EduFlexConstants.FILL_BLANK);
        List<PaperQuestionVo> shortAnswerList = integerListMap.get(EduFlexConstants.SHORT_ANSWER);
        if (!blankList.isEmpty() || !shortAnswerList.isEmpty()) {
            // 若有 则设置为待批阅
            examRecord.setStatus(EduFlexConstants.EXAM_STATUS_PENDING);
        } else {
            // 没有则设置为考试结束
            examRecord.setStatus(EduFlexConstants.EXAM_STATUS_ENDED);
            // 更新考试记录
            baseMapper.updateById(examRecord);
        }

        // 终止定时任务
        SysJob sysJob = jobService.selectJobById(examRecord.getJobId());
        jobService.changeStatus(sysJob);
    }

    private ExamRecordVo buildVo(ExamRecord examRecord) {
        ExamRecordVo examRecordVo = new ExamRecordVo();
        BeanUtils.copyProperties(examRecord, examRecordVo);
        Exam exam = examService.getById(examRecord.getExamId());
        examRecordVo.setExamName(exam.getName());
        SysUser user = userService.selectUserById(examRecord.getUserId());
        examRecordVo.setUserName(user.getUserName());
        examRecordVo.setNickName(user.getNickName());
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

    public Date calculateExamEndTime(Exam exam) {
        // 如果设置了限时，优先使用限时的结束时间
        if (exam.getLimited() == 1) {
            // 计算当前时间到结束时间的分钟差
            long diff = exam.getEndTime().getTime() - DateUtils.getNowDate().getTime();
            if (diff > 0) {
                // 判断时间差是否大于考试时长，如果大于，则使用考试时长，否则使用剩余时间
                if (diff > exam.getDuration() * 60 * 1000) {
                    return new Date(exam.getEndTime().getTime() - exam.getDuration() * 60 * 1000);
                } else {
                    return new Date(exam.getEndTime().getTime() - diff);
                }
            } else {
                return exam.getEndTime();
            }
        } else {
            // 如果没有限时，使用考试时长和开始考试时间来计算结束时间
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(DateUtils.getNowDate());
            calendar.add(Calendar.MINUTE, exam.getDuration());
            return calendar.getTime();
        }
    }
}

package com.eduflex.user.homework.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.homework.service.IHomeworkStudentService;
import com.eduflex.user.homework.domain.dto.HomeworkDto;
import com.eduflex.user.homework.domain.vo.UserHomeworkVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "UserHomeworkController")
@RequestMapping("/user/homework")
public class HomeworkController extends BaseController {

    @Autowired
    private IHomeworkStudentService homeworkStudentService;

    /**
     * 获取作业列表
     *
     * @param homework 查询条件
     * @return 作业列表
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkDto homework) {
        startPage();
        homework.setUserId(getUserId());
        List<UserHomeworkVo> list = homeworkStudentService.selectHomeworkList(homework);
        return getDataTable(list);
    }

    /**
     * 获取作业信息
     *
     * @param id 作业ID
     * @return 作业信息
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        HomeworkDto homeworkDto = new HomeworkDto();
        homeworkDto.setUserId(getUserId());
        homeworkDto.setHomeworkId(id);
        UserHomeworkVo homework = homeworkStudentService.selectHomework(homeworkDto);
        return success(homework);
    }

    /**
     * 提交作业
     *
     * @param homeworkDto 作业信息
     * @return 结果
     */
    @PreAuthorize("@ss.hasRole('student')")
    @PutMapping("/submit")
    public AjaxResult submitHomework(@RequestBody HomeworkDto homeworkDto) {
        homeworkDto.setUserId(getUserId());
        return toAjax(homeworkStudentService.submitHomework(homeworkDto));
    }
}

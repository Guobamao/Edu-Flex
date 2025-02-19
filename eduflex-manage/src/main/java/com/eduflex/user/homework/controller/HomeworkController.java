package com.eduflex.user.homework.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.homework.service.IHomeworkStudentService;
import com.eduflex.user.homework.domain.dto.HomeworkDto;
import com.eduflex.user.homework.domain.vo.HomeworkVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "UserHomeworkController")
@RequestMapping("/user/homework")
public class HomeworkController extends BaseController {

    @Autowired
    private IHomeworkStudentService homeworkStudentService;

    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkDto homework) {
        startPage();
        homework.setUserId(getUserId());
        List<HomeworkVo> list = homeworkStudentService.selectHomeworkList(homework);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        HomeworkDto homeworkDto = new HomeworkDto();
        homeworkDto.setUserId(getUserId());
        homeworkDto.setHomeworkId(id);
        HomeworkVo homework = homeworkStudentService.selectHomework(homeworkDto);
        return success(homework);
    }

    @PreAuthorize("@ss.hasRole('student')")
    @PutMapping("/submit")
    public AjaxResult submitHomework(@RequestBody HomeworkDto homeworkDto) {
        homeworkDto.setUserId(getUserId());
        return toAjax(homeworkStudentService.submitHomework(homeworkDto));
    }
}

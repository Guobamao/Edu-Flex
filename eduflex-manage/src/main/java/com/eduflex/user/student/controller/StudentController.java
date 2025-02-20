package com.eduflex.user.student.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.domain.model.LoginUser;
import com.eduflex.manage.student.domain.vo.StudentVo;
import org.springframework.beans.BeanUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("UserStudentController")
@RequestMapping("/user/student")
public class StudentController extends BaseController {

    /**
     * 学生个人信息
     * @return 学生个人信息
     */
    @PreAuthorize("@ss.hasRole('student')")
    @GetMapping("/profile")
    public AjaxResult profile() {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        StudentVo studentVo = new StudentVo();
        BeanUtils.copyProperties(user, studentVo);
        return success(studentVo);
    }
}

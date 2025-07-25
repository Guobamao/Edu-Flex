package com.eduflex.user.student.controller;

import cn.hutool.core.util.StrUtil;
import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.domain.AjaxResult;
import com.eduflex.common.core.domain.entity.SysUser;
import com.eduflex.common.core.domain.model.LoginUser;
import com.eduflex.common.core.domain.model.RegisterBody;
import com.eduflex.manage.student.domain.vo.StudentVo;
import com.eduflex.manage.student.service.IStudentService;
import com.eduflex.system.service.ISysConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController("UserStudentController")
@RequestMapping("/user/student")
public class StudentController extends BaseController {

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private IStudentService studentService;

    /**
     * 学生个人信息
     *
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

    /**
     * 注册学生账号
     *
     * @param user 注册信息
     * @return 结果
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        String msg = studentService.register(user);
        return StrUtil.isEmpty(msg) ? success() : error(msg);
    }
}

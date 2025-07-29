package com.eduflex.user.direction.controller;

import com.eduflex.common.core.controller.BaseController;
import com.eduflex.common.core.page.TableDataInfo;
import com.eduflex.manage.direction.domain.Direction;
import com.eduflex.manage.direction.service.IDirectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * 课程方向 - 用户端Controller
 *
 * @author 林煜鋒
 * @date 2025-02-13
 */
@RestController(value = "UserDirectionController")
@RequestMapping("/user/direction")
public class DirectionController extends BaseController {

    @Autowired
    private IDirectionService directionService;

    /**
     * 获取课程方向列表
     *
     * @param direction 查询条件
     * @return 课程方向列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Direction direction) {
        startPage();
        List<Direction> list = directionService.selectDirectionList(direction);
        return getDataTable(list);
    }
}

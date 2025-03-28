package com.eduflex.manage.dashboard.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 最近选课趋势Vo
 * @author 林煜鋒
 */
@Data
public class TrendVo {
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private Integer count;
}

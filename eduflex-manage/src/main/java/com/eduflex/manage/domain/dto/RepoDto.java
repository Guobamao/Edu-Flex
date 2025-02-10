package com.eduflex.manage.domain.dto;

import com.eduflex.manage.domain.Repo;
import lombok.Data;

@Data
public class RepoDto extends Repo {
    private Long[] excludes;
}

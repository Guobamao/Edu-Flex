package com.eduflex.manage.repo.domain.dto;

import com.eduflex.manage.repo.domain.Repo;
import lombok.Data;

@Data
public class RepoDto extends Repo {
    private Long[] excludes;
}

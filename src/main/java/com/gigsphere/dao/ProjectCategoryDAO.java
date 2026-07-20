package com.gigsphere.dao;

import com.gigsphere.model.ProjectCategory;

import java.util.List;

public interface ProjectCategoryDAO {

    boolean save(ProjectCategory category);

    ProjectCategory findById(int id);

    List<ProjectCategory> findAll();
}
package com.gigsphere.dao;

import com.gigsphere.model.ProjectAssignment;

public interface ProjectAssignmentDAO {

    boolean save(ProjectAssignment assignment);

    ProjectAssignment findByProjectId(int projectId);
}
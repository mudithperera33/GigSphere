package com.gigsphere.dao;

import com.gigsphere.model.ProjectAssignment;
import java.util.List;

public interface ProjectAssignmentDAO {

    boolean save(ProjectAssignment assignment);
    List<ProjectAssignment> findByFreelancerId(
            int freelancerId
    );

    List<ProjectAssignment> findByClientId(
            int clientId
    );
    ProjectAssignment findByProjectId(int projectId);

}
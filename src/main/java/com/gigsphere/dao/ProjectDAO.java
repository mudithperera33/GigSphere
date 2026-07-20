package com.gigsphere.dao;

import com.gigsphere.model.Project;

import java.util.List;

public interface ProjectDAO {

    boolean save(Project project);

    Project findById(int id);

    List<Project> findAll();

    List<Project> findByClientId(int clientId);

    boolean update(Project project);

    boolean delete(int projectId);

    boolean updateStatus(
            int projectId,
            String status
    );
}
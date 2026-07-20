package com.gigsphere.dao;

import com.gigsphere.model.Project;

import java.util.List;

public class ProjectDAOImpl implements ProjectDAO {

    @Override
    public boolean save(Project project) {
        return false;
    }

    @Override
    public Project findById(int id) {
        return null;
    }

    @Override
    public List<Project> findAll() {
        return null;
    }

    @Override
    public List<Project> findByClientId(int clientId) {
        return null;
    }

    @Override
    public boolean update(Project project) {
        return false;
    }

    @Override
    public boolean delete(int projectId) {
        return false;
    }
}

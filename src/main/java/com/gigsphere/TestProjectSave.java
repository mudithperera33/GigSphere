package com.gigsphere;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.model.Project;

import java.sql.Date;

public class TestProjectSave {

    public static void main(String[] args) {

        Project project =
                new Project();

        project.setTitle(
                "Build E-Commerce Website");

        project.setDescription(
                "Need a Java web application");

        project.setBudget(50000);

        project.setDeadline(
                Date.valueOf("2026-08-31"));

        project.setStatus("OPEN");

        project.setClientId(1);

        project.setCategoryId(1);

        ProjectDAO dao =
                new ProjectDAOImpl();

        boolean saved =
                dao.save(project);

        System.out.println(
                "Saved: " + saved);
    }
}
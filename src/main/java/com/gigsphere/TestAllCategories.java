package com.gigsphere;

import com.gigsphere.dao.ProjectCategoryDAO;
import com.gigsphere.dao.ProjectCategoryDAOImpl;
import com.gigsphere.model.ProjectCategory;

import java.util.List;

public class TestAllCategories {

    public static void main(String[] args) {

        ProjectCategoryDAO dao =
                new ProjectCategoryDAOImpl();

        List<ProjectCategory> categories =
                dao.findAll();

        for(ProjectCategory category :
                categories) {

            System.out.println(
                    category.getId() +
                            " - " +
                            category.getName());
        }
    }
}
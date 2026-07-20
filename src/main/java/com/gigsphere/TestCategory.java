package com.gigsphere;

import com.gigsphere.dao.ProjectCategoryDAO;
import com.gigsphere.dao.ProjectCategoryDAOImpl;
import com.gigsphere.model.ProjectCategory;

public class TestCategory {

    public static void main(String[] args) {

        ProjectCategory category =
                new ProjectCategory();

        category.setName(
                "Web Development");

        category.setDescription(
                "Website development projects");

        ProjectCategoryDAO dao =
                new ProjectCategoryDAOImpl();

        boolean result =
                dao.save(category);

        System.out.println(
                "Saved: " + result
        );
    }
}
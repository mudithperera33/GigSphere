package com.gigsphere;

import com.gigsphere.dao.ProjectCategoryDAO;
import com.gigsphere.dao.ProjectCategoryDAOImpl;
import com.gigsphere.model.ProjectCategory;

public class TestFindCategory {

    public static void main(String[] args) {

        ProjectCategoryDAO dao =
                new ProjectCategoryDAOImpl();

        ProjectCategory category =
                dao.findById(1);

        if(category != null) {

            System.out.println(
                    category.getName());

            System.out.println(
                    category.getDescription());
        }
        else {

            System.out.println(
                    "Category Not Found");
        }
    }
}
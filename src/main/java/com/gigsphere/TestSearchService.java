package com.gigsphere;

import com.gigsphere.model.Project;
import com.gigsphere.service.SearchService;

import java.util.List;

public class TestSearchService {

    public static void main(String[] args) {

        SearchService service =
                new SearchService();

        List<Project> projects =
                service.searchProjects(
                        "website"
                );

        for(Project project : projects) {

            System.out.println(
                    project.getTitle()
            );
        }
    }
}
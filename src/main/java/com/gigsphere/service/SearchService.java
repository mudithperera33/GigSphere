package com.gigsphere.service;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.model.Project;

import java.util.ArrayList;
import java.util.List;

public class SearchService {

    private final ProjectDAO projectDAO;

    public SearchService() {

        this.projectDAO =
                new ProjectDAOImpl();
    }

    /**
     * Search projects using title and description.
     */
    public List<Project> searchProjects(
            String keyword
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            boolean titleMatch =
                    project.getTitle()
                            .toLowerCase()
                            .contains(
                                    keyword.toLowerCase()
                            );

            boolean descriptionMatch =
                    project.getDescription()
                            .toLowerCase()
                            .contains(
                                    keyword.toLowerCase()
                            );

            if(titleMatch || descriptionMatch) {

                results.add(project);
            }
        }

        return results;
    }

    /**
     * Filter projects by budget range.
     */
    public List<Project> filterByBudget(
            double minBudget,
            double maxBudget
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            if(project.getBudget() >= minBudget
                    &&
                    project.getBudget() <= maxBudget) {

                results.add(project);
            }
        }

        return results;
    }

    /**
     * Filter projects by category.
     */
    public List<Project> filterByCategory(
            int categoryId
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            if(project.getCategoryId()
                    == categoryId) {

                results.add(project);
            }
        }

        return results;
    }

    /**
     * Filter projects by status.
     */
    public List<Project> filterByStatus(
            String status
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            if(project.getStatus()
                    .equalsIgnoreCase(status)) {

                results.add(project);
            }
        }

        return results;
    }

    /**
     * Search + category filter.
     */
    public List<Project> searchByKeywordAndCategory(
            String keyword,
            int categoryId
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            boolean keywordMatch =
                    project.getTitle()
                            .toLowerCase()
                            .contains(
                                    keyword.toLowerCase()
                            )
                            ||
                            project.getDescription()
                                    .toLowerCase()
                                    .contains(
                                            keyword.toLowerCase()
                                    );

            boolean categoryMatch =
                    project.getCategoryId()
                            == categoryId;

            if(keywordMatch && categoryMatch) {

                results.add(project);
            }
        }

        return results;
    }

    /**
     * Search using all filters.
     */
    public List<Project> advancedSearch(
            String keyword,
            Integer categoryId,
            Double minBudget,
            Double maxBudget,
            String status
    ) {

        List<Project> results =
                new ArrayList<>();

        List<Project> projects =
                projectDAO.findAll();

        for(Project project : projects) {

            boolean matches = true;

            if(keyword != null
                    && !keyword.isBlank()) {

                boolean keywordMatch =
                        project.getTitle()
                                .toLowerCase()
                                .contains(
                                        keyword.toLowerCase()
                                )
                                ||
                                project.getDescription()
                                        .toLowerCase()
                                        .contains(
                                                keyword.toLowerCase()
                                        );

                if(!keywordMatch) {
                    matches = false;
                }
            }

            if(categoryId != null
                    && project.getCategoryId()
                    != categoryId) {

                matches = false;
            }

            if(minBudget != null
                    && project.getBudget()
                    < minBudget) {

                matches = false;
            }

            if(maxBudget != null
                    && project.getBudget()
                    > maxBudget) {

                matches = false;
            }

            if(status != null
                    && !status.isBlank()) {

                if(!project.getStatus()
                        .equalsIgnoreCase(
                                status
                        )) {

                    matches = false;
                }
            }

            if(matches) {

                results.add(project);
            }
        }

        return results;
    }
}
package com.gigsphere.model;

public class ClientProfile {

    private int id;

    private int userId;

    private String companyName;

    private String description;

    private int projectsPosted;

    private int successfulHires;

    public ClientProfile() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProjectsPosted() {
        return projectsPosted;
    }

    public void setProjectsPosted(int projectsPosted) {
        this.projectsPosted = projectsPosted;
    }

    public int getSuccessfulHires() {
        return successfulHires;
    }

    public void setSuccessfulHires(int successfulHires) {
        this.successfulHires = successfulHires;
    }
}
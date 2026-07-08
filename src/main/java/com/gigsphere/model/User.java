package com.gigsphere.model;

public class User {

    private int id;
    private String name;
    private String email;
    private String passwordHash;
    private String location;

    private boolean clientActive;
    private boolean freelancerActive;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public boolean isClientActive() {
        return clientActive;
    }

    public void setClientActive(boolean clientActive) {
        this.clientActive = clientActive;
    }

    public boolean isFreelancerActive() {
        return freelancerActive;
    }

    public void setFreelancerActive(boolean freelancerActive) {
        this.freelancerActive = freelancerActive;
    }
}
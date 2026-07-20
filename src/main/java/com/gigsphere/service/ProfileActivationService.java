package com.gigsphere.service;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

public class ProfileActivationService {

    private final UserDAO userDAO;

    public ProfileActivationService() {
        this.userDAO = new UserDAOImpl();
    }


    public boolean activateClientProfile(User user) {

        return userDAO.updateRoleFlags(
                user.getId(),
                true,
                user.isFreelancerActive()
        );
    }


    public boolean activateFreelancerProfile(User user) {

        return userDAO.updateRoleFlags(
                user.getId(),
                user.isClientActive(),
                true
        );
    }


    public boolean activateBothProfiles(User user) {

        return userDAO.updateRoleFlags(
                user.getId(),
                true,
                true
        );
    }


    public boolean deactivateClientProfile(User user) {

        return userDAO.updateRoleFlags(
                user.getId(),
                false,
                user.isFreelancerActive()
        );
    }


    public boolean deactivateFreelancerProfile(User user) {

        return userDAO.updateRoleFlags(
                user.getId(),
                user.isClientActive(),
                false
        );
    }
}
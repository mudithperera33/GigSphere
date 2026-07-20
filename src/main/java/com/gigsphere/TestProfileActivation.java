package com.gigsphere;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;
import com.gigsphere.service.ProfileActivationService;

public class TestProfileActivation {

    public static void main(String[] args) {

        UserDAO userDAO = new UserDAOImpl();

        User user =
                userDAO.findByEmail("mudith@gmail.com");

        if (user == null) {

            System.out.println("User not found");
            return;
        }

        ProfileActivationService service =
                new ProfileActivationService();

        boolean success =
                service.activateBothProfiles(user);

        System.out.println("Updated: " + success);
    }
}
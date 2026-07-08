package com.gigsphere.service;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

public class AuthenticationService {

    private final UserDAO userDAO;

    public AuthenticationService() {
        this.userDAO = new UserDAOImpl();
    }

    public boolean register(User user) {

        User existingUser =
                userDAO.findByEmail(user.getEmail());

        if(existingUser != null) {

            System.out.println(
                    "Email already exists!");

            return false;
        }

        return userDAO.save(user);
    }
}
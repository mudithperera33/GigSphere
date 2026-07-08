package com.gigsphere.service;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;
import com.gigsphere.util.PasswordUtil;

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

        String hashedPassword =
                PasswordUtil.hashPassword(
                        user.getPasswordHash());

        user.setPasswordHash(
                hashedPassword);

        return userDAO.save(user);
    }
    public boolean login(
            String email,
            String password
    ) {

        User user =
                userDAO.findByEmail(email);

        if(user == null) {

            return false;
        }

        return PasswordUtil.verifyPassword(
                password,
                user.getPasswordHash()
        );
    }
}
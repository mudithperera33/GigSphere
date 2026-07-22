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

        System.out.println("================================");
        System.out.println("REGISTER ATTEMPT");
        System.out.println("Email: " + user.getEmail());

        User existingUser =
                userDAO.findByEmail(user.getEmail());

        System.out.println(
                "Existing User: " + existingUser
        );

        if(existingUser != null) {

            System.out.println(
                    "EMAIL ALREADY EXISTS"
            );

            return false;
        }

        String hashedPassword =
                PasswordUtil.hashPassword(
                        user.getPasswordHash());

        user.setPasswordHash(
                hashedPassword);

        boolean result =
                userDAO.save(user);

        System.out.println(
                "SAVE RESULT: " + result
        );

        return result;
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
package com.gigsphere;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

public class TestFindUser {

    public static void main(String[] args) {

        UserDAO userDAO =
                new UserDAOImpl();

        User user =
                userDAO.findByEmail(
                        "mudith@gmail.com");

        if(user != null) {

            System.out.println(
                    "User Found");

            System.out.println(
                    user.getName());

        } else {

            System.out.println(
                    "User Not Found");
        }
    }
}
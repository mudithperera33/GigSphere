package com.gigsphere;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

public class TestSaveUser {

    public static void main(String[] args) {

        User user = new User();

        user.setName("Mudith");
        user.setEmail("mudith@gmail.com");
        user.setPasswordHash("123456");
        user.setLocation("Colombo");

        user.setClientActive(true);
        user.setFreelancerActive(true);

        UserDAO userDAO = new UserDAOImpl();

        boolean result = userDAO.save(user);

        if(result) {
            System.out.println("User Saved");
        } else {
            System.out.println("Save Failed");
        }
    }
}
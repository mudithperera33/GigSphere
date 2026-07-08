package com.gigsphere;

import com.gigsphere.model.User;
import com.gigsphere.service.AuthenticationService;

public class TestRegisterUser {

    public static void main(String[] args) {

        User user = new User();

        user.setName("Kamal");
        user.setEmail("kamal@gmail.com");
        user.setPasswordHash("1234567");
        user.setLocation("Colombo");

        user.setClientActive(true);
        user.setFreelancerActive(false);

        AuthenticationService auth =
                new AuthenticationService();

        boolean success =
                auth.register(user);

        if(success) {

            System.out.println(
                    "Registration Successful");

        } else {

            System.out.println(
                    "Registration Failed");
        }
    }
}
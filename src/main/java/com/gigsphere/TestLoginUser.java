package com.gigsphere;

import com.gigsphere.service.AuthenticationService;

public class TestLoginUser {

    public static void main(String[] args) {

        AuthenticationService auth =
                new AuthenticationService();

        boolean loginSuccess =
                auth.login(
                        "kamal@gmail.com",
                        "123456"
                );

        if(loginSuccess) {

            System.out.println(
                    "Login Successful");
        }
        else {

            System.out.println(
                    "Invalid Credentials");
        }
    }
}
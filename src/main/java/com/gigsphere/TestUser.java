package com.gigsphere;

import com.gigsphere.model.User;

public class TestUser {

    public static void main(String[] args) {

        User user = new User();

        user.setName("Mudith");
        user.setEmail("mudith@gmail.com");
        user.setLocation("Colombo");

        System.out.println("Name: " + user.getName());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Location: " + user.getLocation());
    }
}

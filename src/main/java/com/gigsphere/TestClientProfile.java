package com.gigsphere;

import com.gigsphere.dao.ClientProfileDAO;
import com.gigsphere.dao.ClientProfileDAOImpl;
import com.gigsphere.model.ClientProfile;

public class TestClientProfile {

    public static void main(String[] args) {

        ClientProfile profile =
                new ClientProfile();

        profile.setUserId(1);

        profile.setCompanyName(
                "GigSphere Pvt Ltd");

        profile.setDescription(
                "Software Company");

        profile.setProjectsPosted(0);

        profile.setSuccessfulHires(0);

        ClientProfileDAO dao =
                new ClientProfileDAOImpl();

        boolean result =
                dao.save(profile);

        System.out.println(result);
    }
}


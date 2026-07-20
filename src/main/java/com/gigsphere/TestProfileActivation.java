package com.gigsphere;

import com.gigsphere.service.ProfileActivationService;

public class TestProfileActivation {

    public static void main(String[] args) {

        ProfileActivationService service =
                new ProfileActivationService();

        boolean success =
                service.activateBothProfiles(1);

        System.out.println(
                "Updated: " + success
        );
    }
}

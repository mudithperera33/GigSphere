package com.gigsphere;

import com.gigsphere.dao.FreelancerProfileDAO;
import com.gigsphere.dao.FreelancerProfileDAOImpl;
import com.gigsphere.model.FreelancerProfile;

public class TestFreelancerProfile {

    public static void main(String[] args) {

        FreelancerProfile profile =
                new FreelancerProfile();

        profile.setUserId(1);

        profile.setTitle("Java Developer");

        profile.setDescription(
                "Experienced Java and MySQL developer");

        profile.setExperienceLevel("INTERMEDIATE");

        profile.setAverageRating(0.0);

        profile.setCompletedProjects(0);

        FreelancerProfileDAO dao =
                new FreelancerProfileDAOImpl();

        boolean result =
                dao.save(profile);

        if(result) {

            System.out.println(
                    "✅ Freelancer Profile Saved");

        } else {

            System.out.println(
                    "❌ Save Failed");
        }
    }
}

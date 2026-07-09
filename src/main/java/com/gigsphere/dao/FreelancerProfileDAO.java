package com.gigsphere.dao;

import com.gigsphere.model.FreelancerProfile;

public interface FreelancerProfileDAO {

    boolean save(FreelancerProfile profile);

    FreelancerProfile findByUserId(int userId);
}
package com.gigsphere.dao;

import com.gigsphere.model.ClientProfile;

public interface ClientProfileDAO {

    boolean save(ClientProfile profile);

    ClientProfile findByUserId(int userId);
}
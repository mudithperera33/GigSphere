package com.gigsphere.dao;

import com.gigsphere.model.User;

public interface UserDAO {

    boolean save(User user);

    User findByEmail(String email);
}
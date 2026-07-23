package com.gigsphere.dao;

import com.gigsphere.model.User;
import java.util.List;

public interface UserDAO {

    boolean save(User user);

    User findByEmail(String email);

    List<User> findAll();

    boolean updateRoleFlags(
            int userId,
            boolean clientActive,
            boolean freelancerActive
    );
}
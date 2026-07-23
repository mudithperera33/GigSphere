package com.gigsphere.dao;

import com.gigsphere.model.User;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public boolean save(User user) {

        String sql = """
            INSERT INTO users
            (
                name,
                email,
                password_hash,
                location,
                client_active,
                freelancer_active
            )
            VALUES (?, ?, ?, ?, ?, ?)
            """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPasswordHash());
            statement.setString(4, user.getLocation());
            statement.setBoolean(5, user.isClientActive());
            statement.setBoolean(6, user.isFreelancerActive());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public User findByEmail(String email) {

        String sql =
                "SELECT * FROM users WHERE email = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, email);

            ResultSet resultSet =
                    statement.executeQuery();

            if (resultSet.next()) {

                User user = new User();

                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPasswordHash(
                        resultSet.getString("password_hash"));
                user.setLocation(
                        resultSet.getString("location"));

                user.setClientActive(
                        resultSet.getBoolean("client_active"));

                user.setFreelancerActive(
                        resultSet.getBoolean("freelancer_active"));

                return user;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean updateRoleFlags(
            int userId,
            boolean clientActive,
            boolean freelancerActive
    ) {

        String sql = """
            UPDATE users
            SET
                client_active = ?,
                freelancer_active = ?
            WHERE id = ?
            """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setBoolean(1, clientActive);
            statement.setBoolean(2, freelancerActive);
            statement.setInt(3, userId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    @Override
    public List<User> findAll() {

        List<User> users =
                new ArrayList<>();

        String sql =
                "SELECT * FROM users";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet rs =
                        statement.executeQuery()
        ) {

            while (rs.next()) {

                User user =
                        new User();

                user.setId(
                        rs.getInt("id")
                );

                user.setName(
                        rs.getString("name")
                );

                user.setEmail(
                        rs.getString("email")
                );

                user.setLocation(
                        rs.getString("location")
                );

                user.setClientActive(
                        rs.getBoolean("client_active")
                );

                user.setFreelancerActive(
                        rs.getBoolean("freelancer_active")
                );

                users.add(user);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return users;
    }
}

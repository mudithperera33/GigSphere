package com.gigsphere.dao;

import com.gigsphere.model.ClientProfile;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClientProfileDAOImpl implements ClientProfileDAO {

    @Override
    public boolean save(ClientProfile profile) {

        String sql = """
                INSERT INTO client_profiles
                (
                    user_id,
                    company_name,
                    description,
                    projects_posted,
                    successful_hires
                )
                VALUES (?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, profile.getUserId());
            statement.setString(2, profile.getCompanyName());
            statement.setString(3, profile.getDescription());
            statement.setInt(4, profile.getProjectsPosted());
            statement.setInt(5, profile.getSuccessfulHires());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public ClientProfile findByUserId(int userId) {

        String sql =
                "SELECT * FROM client_profiles WHERE user_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            ResultSet rs =
                    statement.executeQuery();

            if(rs.next()) {

                ClientProfile profile =
                        new ClientProfile();

                profile.setId(rs.getInt("id"));
                profile.setUserId(rs.getInt("user_id"));
                profile.setCompanyName(
                        rs.getString("company_name"));
                profile.setDescription(
                        rs.getString("description"));
                profile.setProjectsPosted(
                        rs.getInt("projects_posted"));
                profile.setSuccessfulHires(
                        rs.getInt("successful_hires"));

                return profile;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}

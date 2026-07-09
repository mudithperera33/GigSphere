package com.gigsphere.dao;

import com.gigsphere.model.FreelancerProfile;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FreelancerProfileDAOImpl
        implements FreelancerProfileDAO {

    @Override
    public boolean save(FreelancerProfile profile) {

        String sql = """
                INSERT INTO freelancer_profiles
                (
                    user_id,
                    title,
                    description,
                    experience_level,
                    average_rating,
                    completed_projects
                )
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1,
                    profile.getUserId());

            statement.setString(2,
                    profile.getTitle());

            statement.setString(3,
                    profile.getDescription());

            statement.setString(4,
                    profile.getExperienceLevel());

            statement.setDouble(5,
                    profile.getAverageRating());

            statement.setInt(6,
                    profile.getCompletedProjects());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public FreelancerProfile
    findByUserId(int userId) {

        String sql =
                "SELECT * FROM freelancer_profiles WHERE user_id = ?";

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

                FreelancerProfile profile =
                        new FreelancerProfile();

                profile.setId(
                        rs.getInt("id"));

                profile.setUserId(
                        rs.getInt("user_id"));

                profile.setTitle(
                        rs.getString("title"));

                profile.setDescription(
                        rs.getString("description"));

                profile.setExperienceLevel(
                        rs.getString("experience_level"));

                profile.setAverageRating(
                        rs.getDouble("average_rating"));

                profile.setCompletedProjects(
                        rs.getInt("completed_projects"));

                return profile;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}

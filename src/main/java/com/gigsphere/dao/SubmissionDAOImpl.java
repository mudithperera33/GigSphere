package com.gigsphere.dao;

import com.gigsphere.model.Submission;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SubmissionDAOImpl implements SubmissionDAO {

    @Override
    public boolean save(Submission submission) {

        String sql = """
                INSERT INTO submissions
                (
                    project_id,
                    freelancer_id,
                    current_version
                )
                VALUES (?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    submission.getProjectId());

            statement.setInt(
                    2,
                    submission.getFreelancerId());

            statement.setInt(
                    3,
                    submission.getCurrentVersion());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Submission findByProjectId(
            int projectId
    ) {

        String sql =
                "SELECT * FROM submissions WHERE project_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, projectId);

            ResultSet rs =
                    statement.executeQuery();

            if(rs.next()) {

                Submission submission =
                        new Submission();

                submission.setId(
                        rs.getInt("id"));

                submission.setProjectId(
                        rs.getInt("project_id"));

                submission.setFreelancerId(
                        rs.getInt("freelancer_id"));

                submission.setCurrentVersion(
                        rs.getInt("current_version"));

                return submission;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
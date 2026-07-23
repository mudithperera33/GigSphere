package com.gigsphere.dao;

import com.gigsphere.model.ProjectAssignment;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;


public class ProjectAssignmentDAOImpl
        implements ProjectAssignmentDAO {

    @Override
    public boolean save(
            ProjectAssignment assignment
    ) {

        String sql = """
                INSERT INTO project_assignments
                (
                    project_id,
                    freelancer_id,
                    proposal_id
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
                    assignment.getProjectId());

            statement.setInt(
                    2,
                    assignment.getFreelancerId());

            statement.setInt(
                    3,
                    assignment.getProposalId());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public ProjectAssignment findByProjectId(
            int projectId
    ) {

        String sql =
                "SELECT * FROM project_assignments WHERE project_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, projectId);

            ResultSet rs =
                    statement.executeQuery();

            if (rs.next()) {

                ProjectAssignment assignment =
                        new ProjectAssignment();

                assignment.setId(
                        rs.getInt("id"));

                assignment.setProjectId(
                        rs.getInt("project_id"));

                assignment.setFreelancerId(
                        rs.getInt("freelancer_id"));

                assignment.setProposalId(
                        rs.getInt("proposal_id"));

                assignment.setStartDate(
                        rs.getTimestamp("start_date"));

                return assignment;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    @Override
    public List<ProjectAssignment> findByFreelancerId(
            int freelancerId
    ) {

        List<ProjectAssignment> assignments =
                new ArrayList<>();

        String sql = """
            SELECT *
            FROM project_assignments
            WHERE freelancer_id = ?
            """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    freelancerId
            );

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                ProjectAssignment assignment =
                        new ProjectAssignment();

                assignment.setId(
                        rs.getInt("id")
                );

                assignment.setProjectId(
                        rs.getInt("project_id")
                );

                assignment.setFreelancerId(
                        rs.getInt("freelancer_id")
                );

                assignment.setProposalId(
                        rs.getInt("proposal_id")
                );

                assignments.add(
                        assignment
                );
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return assignments;
    }
    @Override
    public List<ProjectAssignment> findByClientId(
            int clientId
    ) {

        List<ProjectAssignment> assignments =
                new ArrayList<>();

        String sql = """
            SELECT pa.*
            FROM project_assignments pa
            JOIN projects p
                ON p.id = pa.project_id
            WHERE p.client_id = ?
            """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    clientId
            );

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                ProjectAssignment assignment =
                        new ProjectAssignment();

                assignment.setId(
                        rs.getInt("id")
                );

                assignment.setProjectId(
                        rs.getInt("project_id")
                );

                assignment.setFreelancerId(
                        rs.getInt("freelancer_id")
                );

                assignment.setProposalId(
                        rs.getInt("proposal_id")
                );

                assignments.add(
                        assignment
                );
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return assignments;
    }
}
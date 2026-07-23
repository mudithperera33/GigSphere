package com.gigsphere.dao;

import com.gigsphere.model.Project;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAOImpl implements ProjectDAO {

    @Override
    public boolean save(Project project) {

        String sql = """
            INSERT INTO projects (
                title,
                description,
                budget,
                deadline,
                status,
                client_id,
                category_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
            """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, project.getTitle());
            statement.setString(2, project.getDescription());
            statement.setDouble(3, project.getBudget());
            statement.setDate(4, project.getDeadline());
            statement.setString(5, project.getStatus());
            statement.setInt(6, project.getClientId());
            statement.setInt(7, project.getCategoryId());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Project findById(int id) {

        String sql = "SELECT * FROM projects WHERE id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    Project project = new Project();
                    project.setId(rs.getInt("id"));
                    project.setTitle(rs.getString("title"));
                    project.setDescription(rs.getString("description"));
                    project.setBudget(rs.getDouble("budget"));
                    project.setDeadline(rs.getDate("deadline"));
                    project.setStatus(rs.getString("status"));
                    project.setClientId(rs.getInt("client_id"));
                    project.setCategoryId(rs.getInt("category_id"));

                    return project;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Project> findAll() {

        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {
                Project project = new Project();
                project.setId(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setDescription(rs.getString("description"));
                project.setBudget(rs.getDouble("budget"));
                project.setDeadline(rs.getDate("deadline"));
                project.setStatus(rs.getString("status"));
                project.setClientId(rs.getInt("client_id"));
                project.setCategoryId(rs.getInt("category_id"));

                projects.add(project);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return projects;
    }

    @Override
    public List<Project> findByClientId(int clientId) {

        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects WHERE client_id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, clientId);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Project project = new Project();
                    project.setId(rs.getInt("id"));
                    project.setTitle(rs.getString("title"));
                    project.setDescription(rs.getString("description"));
                    project.setBudget(rs.getDouble("budget"));
                    project.setDeadline(rs.getDate("deadline"));
                    project.setStatus(rs.getString("status"));
                    project.setClientId(rs.getInt("client_id"));
                    project.setCategoryId(rs.getInt("category_id"));

                    projects.add(project);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return projects;
    }

    @Override
    public boolean update(Project project) {

        String sql = """
        UPDATE projects
        SET
            title = ?,
            description = ?,
            budget = ?,
            deadline = ?,
            status = ?,
            category_id = ?
        WHERE id = ?
        """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, project.getTitle());
            statement.setString(2, project.getDescription());
            statement.setDouble(3, project.getBudget());
            statement.setDate(4, project.getDeadline());
            statement.setString(5, project.getStatus());
            statement.setInt(6, project.getCategoryId());
            statement.setInt(7, project.getId());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean delete(int projectId) {

        String sql = "DELETE FROM projects WHERE id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, projectId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateStatus(int projectId, String status) {

        String sql = """
            UPDATE projects
            SET status = ?
            WHERE id = ?
            """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, status);
            statement.setInt(2, projectId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
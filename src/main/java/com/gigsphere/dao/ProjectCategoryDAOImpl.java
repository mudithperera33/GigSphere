package com.gigsphere.dao;

import com.gigsphere.model.ProjectCategory;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ProjectCategoryDAOImpl
        implements ProjectCategoryDAO {

    @Override
    public boolean save(ProjectCategory category) {

        String sql = """
                INSERT INTO project_categories
                (
                    name,
                    description
                )
                VALUES (?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(
                    1,
                    category.getName()
            );

            statement.setString(
                    2,
                    category.getDescription()
            );

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public ProjectCategory findById(int id) {

        String sql =
                "SELECT * FROM project_categories WHERE id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            ResultSet rs =
                    statement.executeQuery();

            if (rs.next()) {

                ProjectCategory category =
                        new ProjectCategory();

                category.setId(
                        rs.getInt("id"));

                category.setName(
                        rs.getString("name"));

                category.setDescription(
                        rs.getString("description"));

                return category;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<ProjectCategory> findAll() {

        List<ProjectCategory> categories =
                new ArrayList<>();

        String sql =
                "SELECT * FROM project_categories";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet rs =
                        statement.executeQuery()
        ) {

            while (rs.next()) {

                ProjectCategory category =
                        new ProjectCategory();

                category.setId(
                        rs.getInt("id"));

                category.setName(
                        rs.getString("name"));

                category.setDescription(
                        rs.getString("description"));

                categories.add(category);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return categories;
    }
}

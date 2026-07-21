package com.gigsphere.dao;

import com.gigsphere.model.PortfolioItem;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class PortfolioItemDAOImpl
        implements PortfolioItemDAO {

    @Override
    public boolean save(
            PortfolioItem item
    ) {

        String sql = """
                INSERT INTO portfolio_items
                (
                    freelancer_id,
                    project_id,
                    title,
                    description,
                    category,
                    file_name
                )
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    item.getFreelancerId());

            if(item.getProjectId() == null) {
                statement.setNull(
                        2,
                        java.sql.Types.INTEGER);
            } else {
                statement.setInt(
                        2,
                        item.getProjectId());
            }

            statement.setString(
                    3,
                    item.getTitle());

            statement.setString(
                    4,
                    item.getDescription());

            statement.setString(
                    5,
                    item.getCategory());

            statement.setString(
                    6,
                    item.getFileName());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<PortfolioItem>
    findByFreelancerId(
            int freelancerId
    ) {

        List<PortfolioItem> items =
                new ArrayList<>();

        String sql =
                "SELECT * FROM portfolio_items WHERE freelancer_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    freelancerId);

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                PortfolioItem item =
                        new PortfolioItem();

                item.setId(
                        rs.getInt("id"));

                item.setFreelancerId(
                        rs.getInt("freelancer_id"));

                item.setProjectId(
                        rs.getInt("project_id"));

                item.setTitle(
                        rs.getString("title"));

                item.setDescription(
                        rs.getString("description"));

                item.setCategory(
                        rs.getString("category"));

                item.setFileName(
                        rs.getString("file_name"));

                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}
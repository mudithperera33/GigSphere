package com.gigsphere.dao;

import com.gigsphere.model.Review;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ReviewDAOImpl implements ReviewDAO {

    @Override
    public boolean save(Review review) {

        String sql = """
                INSERT INTO reviews
                (
                    project_id,
                    reviewer_id,
                    reviewee_id,
                    rating,
                    comment
                )
                VALUES (?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1,
                    review.getProjectId());

            statement.setInt(2,
                    review.getReviewerId());

            statement.setInt(3,
                    review.getRevieweeId());

            statement.setInt(4,
                    review.getRating());

            statement.setString(5,
                    review.getComment());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Review> findByUserId(
            int userId
    ) {

        List<Review> reviews =
                new ArrayList<>();

        String sql =
                "SELECT * FROM reviews WHERE reviewee_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                Review review =
                        new Review();

                review.setId(
                        rs.getInt("id"));

                review.setProjectId(
                        rs.getInt("project_id"));

                review.setReviewerId(
                        rs.getInt("reviewer_id"));

                review.setRevieweeId(
                        rs.getInt("reviewee_id"));

                review.setRating(
                        rs.getInt("rating"));

                review.setComment(
                        rs.getString("comment"));

                reviews.add(review);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return reviews;
    }

    @Override
    public double getAverageRating(
            int userId
    ) {

        String sql =
                "SELECT AVG(rating) AS avg_rating FROM reviews WHERE reviewee_id = ?";

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

                return rs.getDouble(
                        "avg_rating");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
    @Override
    public List<Review> findAll() {

        List<Review> reviews =
                new ArrayList<>();

        String sql =
                "SELECT * FROM reviews";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet rs =
                        statement.executeQuery()
        ) {

            while (rs.next()) {

                Review review =
                        new Review();

                review.setId(
                        rs.getInt("id")
                );

                review.setProjectId(
                        rs.getInt("project_id")
                );

                review.setReviewerId(
                        rs.getInt("reviewer_id")
                );

                review.setRevieweeId(
                        rs.getInt("reviewee_id")
                );

                review.setRating(
                        rs.getInt("rating")
                );

                review.setComment(
                        rs.getString("comment")
                );

                reviews.add(review);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return reviews;
    }
}
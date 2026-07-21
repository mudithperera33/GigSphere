package com.gigsphere.dao;

import com.gigsphere.model.Notification;
import com.gigsphere.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAOImpl
        implements NotificationDAO {

    @Override
    public boolean save(Notification notification) {

        String sql = """
                INSERT INTO notifications
                (
                    user_id,
                    type,
                    message
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
                    notification.getUserId());

            statement.setString(
                    2,
                    notification.getType());

            statement.setString(
                    3,
                    notification.getMessage());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Notification>
    findByUserId(int userId) {

        List<Notification> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM notifications WHERE user_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1,userId);

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                Notification n =
                        new Notification();

                n.setId(rs.getInt("id"));
                n.setUserId(rs.getInt("user_id"));
                n.setType(rs.getString("type"));
                n.setMessage(rs.getString("message"));
                n.setRead(rs.getBoolean("is_read"));
                n.setCreatedAt(
                        rs.getTimestamp("created_at")
                );

                list.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean markAsRead(
            int notificationId
    ) {

        String sql =
                "UPDATE notifications SET is_read = true WHERE id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    notificationId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
package com.gigsphere.dao;

import com.gigsphere.model.Message;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class MessageDAOImpl implements MessageDAO {

    @Override
    public boolean save(Message message) {

        String sql = """
                INSERT INTO messages
                (
                    project_id,
                    sender_id,
                    content
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
                    message.getProjectId());

            statement.setInt(
                    2,
                    message.getSenderId());

            statement.setString(
                    3,
                    message.getContent());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Message> findByProjectId(
            int projectId
    ) {

        List<Message> messages =
                new ArrayList<>();

        String sql =
                "SELECT * FROM messages WHERE project_id = ? ORDER BY sent_at";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, projectId);

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                Message message =
                        new Message();

                message.setId(
                        rs.getInt("id"));

                message.setProjectId(
                        rs.getInt("project_id"));

                message.setSenderId(
                        rs.getInt("sender_id"));

                message.setContent(
                        rs.getString("content"));

                message.setSentAt(
                        rs.getTimestamp("sent_at"));

                message.setRead(
                        rs.getBoolean("is_read"));

                messages.add(message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return messages;
    }

    @Override
    public boolean markAsRead(
            int messageId
    ) {

        String sql = """
                UPDATE messages
                SET is_read = true
                WHERE id = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, messageId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    @Override
    public List<Integer> getProjectIdsForUser(
            int userId
    ) {

        List<Integer> projectIds =
                new ArrayList<>();

        String sql = """
            SELECT DISTINCT project_id
            FROM messages
            WHERE sender_id = ?
            """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, userId);

            ResultSet rs =
                    statement.executeQuery();

            while (rs.next()) {

                projectIds.add(
                        rs.getInt("project_id")
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return projectIds;
    }
}
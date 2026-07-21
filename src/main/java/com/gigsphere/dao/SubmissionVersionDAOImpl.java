package com.gigsphere.dao;

import com.gigsphere.model.SubmissionVersion;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class SubmissionVersionDAOImpl
        implements SubmissionVersionDAO {

    @Override
    public boolean save(
            SubmissionVersion version
    ) {

        String sql = """
                INSERT INTO submission_versions
                (
                    submission_id,
                    version_number,
                    file_name,
                    file_type,
                    file_size_bytes,
                    status,
                    client_note
                )
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    version.getSubmissionId());

            statement.setInt(
                    2,
                    version.getVersionNumber());

            statement.setString(
                    3,
                    version.getFileName());

            statement.setString(
                    4,
                    version.getFileType());

            statement.setLong(
                    5,
                    version.getFileSizeBytes());

            statement.setString(
                    6,
                    version.getStatus());

            statement.setString(
                    7,
                    version.getClientNote());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<SubmissionVersion>
    findBySubmissionId(
            int submissionId
    ) {

        List<SubmissionVersion> versions =
                new ArrayList<>();

        String sql =
                "SELECT * FROM submission_versions WHERE submission_id = ? ORDER BY version_number";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, submissionId);

            ResultSet rs =
                    statement.executeQuery();

            while(rs.next()) {

                SubmissionVersion version =
                        new SubmissionVersion();

                version.setId(
                        rs.getInt("id"));

                version.setSubmissionId(
                        rs.getInt("submission_id"));

                version.setVersionNumber(
                        rs.getInt("version_number"));

                version.setFileName(
                        rs.getString("file_name"));

                version.setFileType(
                        rs.getString("file_type"));

                version.setFileSizeBytes(
                        rs.getLong("file_size_bytes"));

                version.setStatus(
                        rs.getString("status"));

                version.setClientNote(
                        rs.getString("client_note"));

                version.setUploadedAt(
                        rs.getTimestamp("uploaded_at"));

                versions.add(version);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return versions;
    }

    @Override
    public boolean updateStatus(
            int versionId,
            String status,
            String clientNote
    ) {

        String sql = """
                UPDATE submission_versions
                SET
                    status = ?,
                    client_note = ?
                WHERE id = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, status);
            statement.setString(2, clientNote);
            statement.setInt(3, versionId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
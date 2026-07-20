package com.gigsphere.dao;

import com.gigsphere.model.Proposal;
import com.gigsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ProposalDAOImpl implements ProposalDAO {

    @Override
    public boolean save(Proposal proposal) {

        String sql = """
                INSERT INTO proposals
                (
                    project_id,
                    freelancer_id,
                    cover_letter,
                    bid_amount,
                    expected_days,
                    status
                )
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, proposal.getProjectId());
            statement.setInt(2, proposal.getFreelancerId());
            statement.setString(3, proposal.getCoverLetter());
            statement.setDouble(4, proposal.getBidAmount());
            statement.setInt(5, proposal.getExpectedDays());
            statement.setString(6, proposal.getStatus());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Proposal findById(int id) {

        String sql =
                "SELECT * FROM proposals WHERE id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, id);

            ResultSet rs =
                    statement.executeQuery();

            if (rs.next()) {

                Proposal proposal = new Proposal();

                proposal.setId(rs.getInt("id"));
                proposal.setProjectId(rs.getInt("project_id"));
                proposal.setFreelancerId(rs.getInt("freelancer_id"));
                proposal.setCoverLetter(rs.getString("cover_letter"));
                proposal.setBidAmount(rs.getDouble("bid_amount"));
                proposal.setExpectedDays(rs.getInt("expected_days"));
                proposal.setStatus(rs.getString("status"));

                return proposal;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Proposal> findByProjectId(int projectId) {

        List<Proposal> proposals =
                new ArrayList<>();

        String sql =
                "SELECT * FROM proposals WHERE project_id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, projectId);

            ResultSet rs =
                    statement.executeQuery();

            while (rs.next()) {

                Proposal proposal =
                        new Proposal();

                proposal.setId(rs.getInt("id"));
                proposal.setProjectId(rs.getInt("project_id"));
                proposal.setFreelancerId(rs.getInt("freelancer_id"));
                proposal.setCoverLetter(rs.getString("cover_letter"));
                proposal.setBidAmount(rs.getDouble("bid_amount"));
                proposal.setExpectedDays(rs.getInt("expected_days"));
                proposal.setStatus(rs.getString("status"));

                proposals.add(proposal);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return proposals;
    }

    @Override
    public List<Proposal> findByFreelancerId(int freelancerId) {

        List<Proposal> proposals =
                new ArrayList<>();

        String sql =
                "SELECT * FROM proposals WHERE freelancer_id = ?";

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, freelancerId);

            ResultSet rs =
                    statement.executeQuery();

            while (rs.next()) {

                Proposal proposal =
                        new Proposal();

                proposal.setId(rs.getInt("id"));
                proposal.setProjectId(rs.getInt("project_id"));
                proposal.setFreelancerId(rs.getInt("freelancer_id"));
                proposal.setCoverLetter(rs.getString("cover_letter"));
                proposal.setBidAmount(rs.getDouble("bid_amount"));
                proposal.setExpectedDays(rs.getInt("expected_days"));
                proposal.setStatus(rs.getString("status"));

                proposals.add(proposal);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return proposals;
    }

    @Override
    public boolean updateStatus(
            int proposalId,
            String status
    ) {

        String sql = """
                UPDATE proposals
                SET status = ?
                WHERE id = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, status);
            statement.setInt(2, proposalId);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}

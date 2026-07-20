package com.gigsphere.dao;

import com.gigsphere.model.Proposal;

import java.util.List;

public interface ProposalDAO {

    boolean save(Proposal proposal);

    Proposal findById(int id);

    List<Proposal> findByProjectId(int projectId);

    List<Proposal> findByFreelancerId(int freelancerId);

    boolean updateStatus(
            int proposalId,
            String status
    );
}
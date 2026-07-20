package com.gigsphere.service;

import com.gigsphere.dao.ProjectAssignmentDAO;
import com.gigsphere.dao.ProjectAssignmentDAOImpl;
import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;
import com.gigsphere.model.ProjectAssignment;
import com.gigsphere.model.Proposal;

public class ProposalAcceptanceService {

    private final ProposalDAO proposalDAO;
    private final ProjectDAO projectDAO;
    private final ProjectAssignmentDAO assignmentDAO;

    public ProposalAcceptanceService() {

        proposalDAO =
                new ProposalDAOImpl();

        projectDAO =
                new ProjectDAOImpl();

        assignmentDAO =
                new ProjectAssignmentDAOImpl();
    }

    public boolean acceptProposal(
            Proposal proposal
    ) {

        boolean accepted =
                proposalDAO.updateStatus(
                        proposal.getId(),
                        "ACCEPTED");

        if(!accepted) {
            return false;
        }

        projectDAO.updateStatus(
                proposal.getProjectId(),
                "IN_PROGRESS");

        ProjectAssignment assignment =
                new ProjectAssignment();

        assignment.setProjectId(
                proposal.getProjectId());

        assignment.setFreelancerId(
                proposal.getFreelancerId());

        assignment.setProposalId(
                proposal.getId());

        return assignmentDAO.save(
                assignment);
    }
}
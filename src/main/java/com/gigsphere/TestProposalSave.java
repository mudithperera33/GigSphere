package com.gigsphere;

import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;
import com.gigsphere.model.Proposal;

public class TestProposalSave {

    public static void main(String[] args) {

        Proposal proposal = new Proposal();

        // Make sure these IDs already exist
        proposal.setProjectId(1);
        proposal.setFreelancerId(1);

        proposal.setCoverLetter(
                "I have extensive experience in Java development and can complete this project within the required timeline."
        );

        proposal.setBidAmount(45000.00);

        proposal.setExpectedDays(10);

        proposal.setStatus("PENDING");

        ProposalDAO proposalDAO =
                new ProposalDAOImpl();

        boolean saved =
                proposalDAO.save(proposal);

        if(saved) {

            System.out.println(
                    "Proposal Saved Successfully"
            );

        } else {

            System.out.println(
                    "Proposal Save Failed"
            );
        }
    }
}
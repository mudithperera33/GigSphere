package com.gigsphere;

import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;
import com.gigsphere.model.Proposal;
import com.gigsphere.service.ProposalAcceptanceService;

public class TestProposalAcceptance {

    public static void main(String[] args) {

        ProposalDAO dao =
                new ProposalDAOImpl();

        Proposal proposal =
                dao.findById(1);

        ProposalAcceptanceService service =
                new ProposalAcceptanceService();

        boolean success =
                service.acceptProposal(
                        proposal);

        System.out.println(
                "Accepted: " + success
        );
    }
}
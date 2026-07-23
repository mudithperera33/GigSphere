package com.gigsphere.servlet;

import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;
import com.gigsphere.model.Proposal;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/submit-proposal")
public class SubmitProposalServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        int projectId =
                Integer.parseInt(
                        request.getParameter("projectId")
                );

        String coverLetter =
                request.getParameter("coverLetter");

        double bidAmount =
                Double.parseDouble(
                        request.getParameter("bidAmount")
                );

        int expectedDays =
                Integer.parseInt(
                        request.getParameter(
                                "expectedDays"
                        )
                );

        Integer freelancerId =
                (Integer) request.getSession()
                        .getAttribute("userId");

        Proposal proposal =
                new Proposal();

        proposal.setProjectId(projectId);
        proposal.setFreelancerId(freelancerId);
        proposal.setCoverLetter(coverLetter);
        proposal.setBidAmount(bidAmount);
        proposal.setExpectedDays(expectedDays);
        proposal.setStatus("PENDING");

        ProposalDAO dao =
                new ProposalDAOImpl();

        boolean success =
                dao.save(proposal);

        if(success){

            request.getSession()
                    .setAttribute(
                            "flashSuccess",
                            "Proposal submitted."
                    );

        } else {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Proposal submission failed."
                    );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/freelancer/projects.jsp"
        );
    }
}

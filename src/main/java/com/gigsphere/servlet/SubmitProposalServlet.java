package com.gigsphere.servlet;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;

import com.gigsphere.model.Project;
import com.gigsphere.model.Proposal;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/submit-proposal")
public class SubmitProposalServlet extends HttpServlet {

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
                        request.getParameter("expectedDays")
                );

        Integer freelancerId =
                (Integer) request.getSession()
                        .getAttribute("userId");

        ProjectDAO projectDAO =
                new ProjectDAOImpl();

        Project project =
                projectDAO.findById(projectId);

        if (project == null) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Project not found."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/projects.jsp"
            );

            return;
        }

        if (!"OPEN".equalsIgnoreCase(
                project.getStatus()
        )) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "This project is no longer accepting proposals."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/projects.jsp"
            );

            return;
        }

        Proposal proposal =
                new Proposal();

        proposal.setProjectId(projectId);
        proposal.setFreelancerId(freelancerId);
        proposal.setCoverLetter(coverLetter);
        proposal.setBidAmount(bidAmount);
        proposal.setExpectedDays(expectedDays);
        proposal.setStatus("PENDING");

        ProposalDAO proposalDAO =
                new ProposalDAOImpl();

        boolean success =
                proposalDAO.save(proposal);

        if (success) {

            request.getSession()
                    .setAttribute(
                            "flashSuccess",
                            "Proposal submitted successfully."
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
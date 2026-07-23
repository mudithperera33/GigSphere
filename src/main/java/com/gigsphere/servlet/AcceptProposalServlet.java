package com.gigsphere.servlet;

import com.gigsphere.dao.ProposalDAO;
import com.gigsphere.dao.ProposalDAOImpl;
import com.gigsphere.model.Proposal;
import com.gigsphere.service.ProposalAcceptanceService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.gigsphere.model.Notification;
import com.gigsphere.dao.NotificationDAO;
import com.gigsphere.dao.NotificationDAOImpl;

import java.io.IOException;

@WebServlet("/accept-proposal")
public class AcceptProposalServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int proposalId = Integer.parseInt(idParam);

                ProposalDAO proposalDAO = new ProposalDAOImpl();
                Proposal proposal = proposalDAO.findById(proposalId);

                if (proposal != null) {
                    ProposalAcceptanceService service = new ProposalAcceptanceService();
                    boolean success = service.acceptProposal(proposal);

                    if (success) {
                        request.getSession().setAttribute(
                                "flashSuccess",
                                "Proposal Accepted"
                        );
                        Notification notification =
                                new Notification();

                        notification.setUserId(
                                proposal.getFreelancerId()
                        );

                        notification.setType(
                                "PROPOSAL_ACCEPTED"
                        );

                        notification.setMessage(
                                "Your proposal has been accepted."
                        );

                        NotificationDAO notificationDAO =
                                new NotificationDAOImpl();

                        notificationDAO.save(notification);
                    } else {
                        request.getSession().setAttribute(
                                "flashError",
                                "Unable To Accept Proposal"
                        );
                    }
                } else {
                    request.getSession().setAttribute(
                            "flashError",
                            "Proposal not found."
                    );
                }
            } catch (NumberFormatException e) {
                request.getSession().setAttribute(
                        "flashError",
                        "Invalid Proposal ID format."
                );
            }
        } else {
            request.getSession().setAttribute(
                    "flashError",
                    "Missing Proposal ID."
            );
        }

        response.sendRedirect(
                request.getContextPath() + "/client/proposals.jsp"
        );
    }
}
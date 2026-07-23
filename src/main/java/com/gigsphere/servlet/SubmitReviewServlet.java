package com.gigsphere.servlet;

import com.gigsphere.dao.ReviewDAO;
import com.gigsphere.dao.ReviewDAOImpl;
import com.gigsphere.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/submit-review")
public class SubmitReviewServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer reviewerId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (reviewerId == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        try {
            int revieweeId = Integer.parseInt(request.getParameter("revieweeId"));
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            Review review = new Review();
            review.setProjectId(projectId);
            review.setReviewerId(reviewerId);
            review.setRevieweeId(revieweeId);
            review.setRating(rating);
            review.setComment(comment != null ? comment.trim() : "");

            ReviewDAO dao = new ReviewDAOImpl();
            dao.save(review);

            request.getSession().setAttribute("flashSuccess", "Review submitted successfully!");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("flashError", "Invalid review parameters provided.");
        }

        response.sendRedirect(
                request.getContextPath() + "/dashboard.jsp"
        );
    }
}
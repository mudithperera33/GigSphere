package com.gigsphere.servlet;

import com.gigsphere.dao.PortfolioItemDAO;
import com.gigsphere.dao.PortfolioItemDAOImpl;
import com.gigsphere.model.PortfolioItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-portfolio")
public class AddPortfolioServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer freelancerId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (freelancerId == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        if (title != null && !title.trim().isEmpty()) {
            PortfolioItem item = new PortfolioItem();
            item.setFreelancerId(freelancerId);
            item.setTitle(title.trim());
            item.setDescription(description != null ? description.trim() : "");
            item.setCategory(category != null ? category.trim() : "");

            PortfolioItemDAO dao = new PortfolioItemDAOImpl();
            dao.save(item);

            request.getSession().setAttribute("flashSuccess", "Portfolio item added successfully!");
        } else {
            request.getSession().setAttribute("flashError", "Failed to add portfolio item. Title is required.");
        }

        response.sendRedirect(
                request.getContextPath() + "/freelancer/portfolio.jsp"
        );
    }
}
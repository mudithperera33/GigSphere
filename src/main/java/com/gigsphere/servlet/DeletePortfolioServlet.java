package com.gigsphere.servlet;

import com.gigsphere.dao.PortfolioItemDAO;
import com.gigsphere.dao.PortfolioItemDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/delete-portfolio")
public class DeletePortfolioServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );

        PortfolioItemDAO dao =
                new PortfolioItemDAOImpl();

        dao.delete(id);

        response.sendRedirect(
                request.getContextPath()
                        + "/freelancer/portfolio.jsp"
        );
    }
}
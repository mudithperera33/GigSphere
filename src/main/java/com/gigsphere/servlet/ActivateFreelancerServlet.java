package com.gigsphere.servlet;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/activate-freelancer")
public class ActivateFreelancerServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        HttpSession session =
                request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        String email =
                (String) session.getAttribute("email");

        UserDAO dao =
                new UserDAOImpl();

        User user =
                dao.findByEmail(email);

        dao.updateRoleFlags(
                userId,
                user.isClientActive(),
                true
        );

        session.setAttribute(
                "role",
                "FREELANCER"
        );

        response.sendRedirect(
                request.getContextPath()
                        + "/dashboard.jsp"
        );
    }
}

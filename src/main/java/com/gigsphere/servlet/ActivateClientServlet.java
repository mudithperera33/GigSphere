package com.gigsphere.servlet;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/activate-client")
public class ActivateClientServlet extends HttpServlet {

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
                true,
                user.isFreelancerActive()
        );

        session.setAttribute(
                "role",
                "CLIENT"
        );

        response.sendRedirect(
                request.getContextPath()
                        + "/dashboard.jsp"
        );
    }
}

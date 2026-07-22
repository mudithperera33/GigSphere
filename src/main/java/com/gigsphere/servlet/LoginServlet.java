package com.gigsphere.servlet;

import com.gigsphere.dao.UserDAO;
import com.gigsphere.dao.UserDAOImpl;
import com.gigsphere.model.User;
import com.gigsphere.service.AuthenticationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        AuthenticationService authService =
                new AuthenticationService();

        boolean success =
                authService.login(
                        email,
                        password
                );

        if(success) {

            UserDAO userDAO =
                    new UserDAOImpl();

            User user =
                    userDAO.findByEmail(email);

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "user",
                    user.getName()
            );

            if(user.isClientActive()) {

                session.setAttribute(
                        "role",
                        "CLIENT"
                );

            } else if(user.isFreelancerActive()) {

                session.setAttribute(
                        "role",
                        "FREELANCER"
                );

            } else {

                session.setAttribute(
                        "role",
                        "USER"
                );
            }

            session.setAttribute(
                    "userId",
                    user.getId()
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/dashboard.jsp"
            );

        } else {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Invalid email or password."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/auth/login.jsp"
            );
        }
    }
}

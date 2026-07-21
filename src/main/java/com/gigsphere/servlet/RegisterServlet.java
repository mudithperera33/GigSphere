package com.gigsphere.servlet;

import com.gigsphere.model.User;
import com.gigsphere.service.AuthenticationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    )
            throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPasswordHash(password);

        AuthenticationService service =
                new AuthenticationService();

        boolean registered =
                service.register(user);

        if(registered) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/auth/login.jsp"
            );

        } else {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Registration failed."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/auth/register.jsp"
            );
        }
    }
}
package com.gigsphere.servlet;

import com.gigsphere.model.User;
import com.gigsphere.service.AuthenticationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String location =
                request.getParameter("location");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPasswordHash(password);

        // Required fields
        user.setLocation(
                location != null
                        ? location
                        : "Not Specified"
        );

        user.setClientActive(false);
        user.setFreelancerActive(false);

        AuthenticationService authService =
                new AuthenticationService();

        boolean success =
                authService.register(user);

        if (success) {

            request.getSession()
                    .setAttribute(
                            "flashSuccess",
                            "Registration successful. Please login."
                    );

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
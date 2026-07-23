package com.gigsphere.servlet;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.model.Project;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/complete-project")
public class CompleteProjectServlet
        extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        int projectId =
                Integer.parseInt(
                        request.getParameter(
                                "projectId"
                        )
                );

        ProjectDAO projectDAO =
                new ProjectDAOImpl();

        projectDAO.updateStatus(
                projectId,
                "COMPLETED"
        );

        request.getSession()
                .setAttribute(
                        "flashSuccess",
                        "Project Completed"
                );

        response.sendRedirect(
                request.getContextPath()
                        + "/client/projects.jsp"
        );
    }
}
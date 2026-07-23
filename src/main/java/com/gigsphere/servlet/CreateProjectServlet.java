package com.gigsphere.servlet;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.model.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/create-project")
public class CreateProjectServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String title =
                request.getParameter("title");

        String description =
                request.getParameter("description");

        double budget =
                Double.parseDouble(
                        request.getParameter("budget"));

        Date deadline =
                Date.valueOf(
                        request.getParameter("deadline"));

        int categoryId =
                Integer.parseInt(
                        request.getParameter("categoryId"));

        Project project =
                new Project();

        project.setTitle(title);
        project.setDescription(description);
        project.setBudget(budget);
        project.setDeadline(deadline);

        project.setStatus("OPEN");

        Integer userId =
                (Integer) request.getSession()
                        .getAttribute("userId");

        project.setClientId(userId);

        project.setCategoryId(categoryId);

        ProjectDAO dao =
                new ProjectDAOImpl();

        boolean success =
                dao.save(project);

        if(success){

            request.getSession()
                    .setAttribute(
                            "flashSuccess",
                            "Project created successfully."
                    );

        } else {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Project creation failed."
                    );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/client/projects.jsp"
        );
    }
}

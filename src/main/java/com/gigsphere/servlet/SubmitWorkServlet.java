package com.gigsphere.servlet;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.dao.SubmissionDAO;
import com.gigsphere.dao.SubmissionDAOImpl;
import com.gigsphere.dao.SubmissionVersionDAO;
import com.gigsphere.dao.SubmissionVersionDAOImpl;
import com.gigsphere.model.Project;
import com.gigsphere.model.Submission;
import com.gigsphere.model.SubmissionVersion;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.gigsphere.model.Notification;
import com.gigsphere.dao.NotificationDAO;
import com.gigsphere.dao.NotificationDAOImpl;

import java.io.IOException;

@WebServlet("/submit-work")
public class SubmitWorkServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        int projectId =
                Integer.parseInt(
                        request.getParameter("projectId")
                );

        Integer freelancerId =
                (Integer) request.getSession()
                        .getAttribute("userId");

        String fileName =
                request.getParameter("fileName");

        ProjectDAO projectDAO =
                new ProjectDAOImpl();

        Project project =
                projectDAO.findById(projectId);

        if (project == null) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Project not found."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/assigned-projects.jsp"
            );

            return;
        }

        if ("COMPLETED".equalsIgnoreCase(
                project.getStatus()
        )) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Project is already completed."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/assigned-projects.jsp"
            );

            return;
        }

        Submission submission =
                new Submission();

        submission.setProjectId(projectId);

        submission.setFreelancerId(
                freelancerId
        );

        submission.setCurrentVersion(1);

        SubmissionDAO submissionDAO =
                new SubmissionDAOImpl();

        boolean submissionSaved =
                submissionDAO.save(submission);

        if (!submissionSaved) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Failed to save submission."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/assigned-projects.jsp"
            );

            return;
        }

        Submission savedSubmission =
                submissionDAO.findByProjectId(projectId);

        if (savedSubmission == null) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Unable to retrieve submission."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/freelancer/assigned-projects.jsp"
            );

            return;
        }

        SubmissionVersion version =
                new SubmissionVersion();

        version.setSubmissionId(
                savedSubmission.getId()
        );

        version.setVersionNumber(1);

        version.setFileName(fileName);

        version.setFileType("ZIP");

        version.setFileSizeBytes(0);

        version.setStatus("PENDING_REVIEW");

        version.setClientNote(null);

        SubmissionVersionDAO versionDAO =
                new SubmissionVersionDAOImpl();

        boolean versionSaved =
                versionDAO.save(version);

        if (versionSaved) {

            request.getSession()
                    .setAttribute(
                            "flashSuccess",
                            "Work submitted successfully."
                    );
            Notification notification =
                    new Notification();

            notification.setUserId(
                    project.getClientId()
            );

            notification.setType(
                    "WORK_SUBMITTED"
            );

            notification.setMessage(
                    "A freelancer submitted work for project: "
                            + project.getTitle()
            );

            new NotificationDAOImpl()
                    .save(notification);

        } else {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Failed to save submission version."
                    );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/freelancer/assigned-projects.jsp"
        );
    }
}
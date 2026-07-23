<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>

<%@ page import="com.gigsphere.dao.SubmissionDAO" %>
<%@ page import="com.gigsphere.dao.SubmissionDAOImpl" %>

<%@ page import="com.gigsphere.dao.SubmissionVersionDAO" %>
<%@ page import="com.gigsphere.dao.SubmissionVersionDAOImpl" %>

<%@ page import="com.gigsphere.model.Project" %>
<%@ page import="com.gigsphere.model.Submission" %>
<%@ page import="com.gigsphere.model.SubmissionVersion" %>

<%
request.setAttribute("pageTitle", "Submitted Work");
request.setAttribute("activePage", "submissions");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

Integer userId = (Integer) session.getAttribute("userId");

ProjectDAO projectDAO = new ProjectDAOImpl();
SubmissionDAO submissionDAO = new SubmissionDAOImpl();
SubmissionVersionDAO versionDAO = new SubmissionVersionDAOImpl();

List<Project> projects = projectDAO.findByClientId(userId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h3 class="mb-4">
        Project Submissions
    </h3>

    <%
    boolean hasSubmissions = false;

    if (projects != null && !projects.isEmpty()) {

        for (Project project : projects) {

            Submission submission =
                    submissionDAO.findByProjectId(
                            project.getId()
                    );

            if (submission == null) {
                continue;
            }

            SubmissionVersion version =
                    versionDAO.findLatestBySubmissionId(
                            submission.getId()
                    );

            if (version == null) {
                continue;
            }

            hasSubmissions = true;
    %>

    <div class="card mb-4 shadow-sm">

        <div class="card-body">

            <div class="d-flex justify-content-between align-items-center">

                <h5 class="mb-0">
                    <%= project.getTitle() %>
                </h5>

                <span class="badge bg-primary">
                    <%= project.getStatus() %>
                </span>

            </div>

            <hr>

            <p class="mb-1">
                <strong>Version:</strong>
                <%= version.getVersionNumber() %>
            </p>

            <p class="mb-1">
                <strong>File Name:</strong>
                <%= version.getFileName() %>
            </p>

            <p class="mb-1">
                <strong>File Type:</strong>
                <%= version.getFileType() %>
            </p>

            <p class="mb-1">
                <strong>Status:</strong>
                <%= version.getStatus() %>
            </p>

            <p class="mb-3">
                <strong>Uploaded:</strong>
                <%= version.getUploadedAt() %>
            </p>

            <div class="mt-3 d-flex align-items-center gap-2">

            <% if ("COMPLETED".equalsIgnoreCase(project.getStatus())) { %>

                <span class="badge bg-success py-2 px-3 me-2">
                    Project Completed
                </span>

                <a href="<%= ctx %>/review.jsp?projectId=<%= project.getId() %>&revieweeId=<%= submission.getFreelancerId() %>"
                   class="btn btn-warning btn-sm">
                    <i class="bi bi-star-fill me-1"></i>
                    Leave Review
                </a>

            <% } else { %>

                <a href="<%= ctx %>/complete-project?projectId=<%= project.getId() %>"
                   class="btn btn-success">
                    <i class="bi bi-check-circle-fill me-1"></i>
                    Approve Work
                </a>

            <% } %>

            </div>

        </div>

    </div>

    <%
        }
    }

    if (!hasSubmissions) {
    %>

    <div class="alert alert-info shadow-sm">
        No submitted work pending review.
    </div>

    <% } %>

</div>

<%@ include file="../includes/footer.jsp" %>
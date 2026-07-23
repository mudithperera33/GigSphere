<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.dao.SubmissionDAO" %>
<%@ page import="com.gigsphere.dao.SubmissionDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>
<%@ page import="com.gigsphere.model.Submission" %>

<%
request.setAttribute(
        "pageTitle",
        "Submitted Work"
);

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp");
    return;
}

Integer userId = (Integer) session.getAttribute("userId");

ProjectDAO projectDAO = new ProjectDAOImpl();
SubmissionDAO submissionDAO = new SubmissionDAOImpl();

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
        for(Project project : projects){

            Submission submission = submissionDAO.findByProjectId(project.getId());

            if(submission == null) {
                continue;
            }
            hasSubmissions = true;
    %>

    <div class="card mb-3 gs-card-hover">

        <div class="card-body">

            <div class="d-flex justify-content-between align-items-start mb-2">
                <h5 class="card-title mb-0">
                    <%= project.getTitle() %>
                </h5>
                <span class="badge bg-info text-dark">
                    Version <%= submission.getCurrentVersion() %>
                </span>
            </div>

            <p class="card-text text-secondary mb-3">
                Submission received and ready for client approval.
            </p>

           <% if ("COMPLETED".equalsIgnoreCase(project.getStatus())) { %>

               <div class="d-flex gap-2">

                   <span class="badge bg-success">

                       Project Completed

                   </span>

                   <a href="<%= p?projectId=<%= project.getId() %>&revieweeId=<%= submission.getFreelancerId() %>"
                      class="btn btn-warning btn-sm">

                       Leave Review

                   </a>

               </div>

           <% } else { %>

               <a href="<%= request.getContextPath()  %>/complete-project?projectId=<%= project.getId() %>"

                  class="btn btn-success">
                   <i class="bi bi-check-circle-fill me-1"></i>
                   Approve Work
               </a>

           <% } %>

        </div>

    </div>

    <%
        }
    }

    if (!hasSubmissions) {
    %>

        <div class="alert alert-info">
            <i class="bi bi-info-circle me-1"></i> No submitted work pending review for your projects.
        </div>

    <% } %>

</div>

<%@ include file="../includes/footer.jsp" %>
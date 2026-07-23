<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectAssignmentDAO" %>
<%@ page import="com.gigsphere.dao.ProjectAssignmentDAOImpl" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.ProjectAssignment" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Assigned Projects");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp");
    return;
}

Integer freelancerId = (Integer) session.getAttribute("userId");

ProjectAssignmentDAO assignmentDAO = new ProjectAssignmentDAOImpl();
ProjectDAO projectDAO = new ProjectDAOImpl();

List<ProjectAssignment> assignments =
        assignmentDAO.findByFreelancerId(freelancerId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h3 class="mb-4">
        Assigned Projects
    </h3>

    <% if (assignments == null || assignments.isEmpty()) { %>

        <div class="alert alert-info">
            <i class="bi bi-info-circle me-1"></i> You have no assigned projects at the moment.
        </div>

    <% } else { %>

        <% for(ProjectAssignment assignment : assignments){

            Project project = projectDAO.findById(assignment.getProjectId());
            if (project == null) continue;
        %>

        <div class="card mb-3 gs-card-hover">

            <div class="card-body">

                <div class="d-flex justify-content-between align-items-start mb-2">
                    <h5 class="card-title mb-0">
                        <%= project.getTitle() %>
                    </h5>
                    <p>

                        Status:

                        <span class="badge bg-primary">

                            <%= project.getStatus() %>

                        </span>

                    </p>
                    <span class="badge bg-primary">
                        <%= project.getStatus() %>
                    </span>
                </div>

                <p class="card-text text-secondary">
                    <%= project.getDescription() %>
                </p>

                <div class="mt-3">

                    <a href="<%= request.getContextPath() %>/freelancer/submit-work.jsp?projectId=<%= project.getId() %>"
                       class="btn btn-success">
                        <i class="bi bi-upload me-1"></i> Submit Work
                    </a>

                </div>

            </div>

        </div>

        <% } %>

    <% } %>

</div>

<%@ include file="../includes/footer.jsp" %>
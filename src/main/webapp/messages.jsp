<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectAssignmentDAO" %>
<%@ page import="com.gigsphere.dao.ProjectAssignmentDAOImpl" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.ProjectAssignment" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute(
        "pageTitle",
        "Messages"
);

if(session.getAttribute("user") == null){
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

Integer userId = (Integer) session.getAttribute("userId");
String role = (String) session.getAttribute("role");

ProjectAssignmentDAO assignmentDAO = new ProjectAssignmentDAOImpl();
List<ProjectAssignment> assignments;

if("CLIENT".equalsIgnoreCase(role)) {
    assignments = assignmentDAO.findByClientId(userId);
} else {
    assignments = assignmentDAO.findByFreelancerId(userId);
}

ProjectDAO projectDAO = new ProjectDAOImpl();
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <div class="card">

        <div class="card-body">

            <h3 class="mb-4">
                Conversations
            </h3>

            <% if(assignments == null || assignments.isEmpty()){ %>

                <div class="alert alert-info mb-0">
                    No active conversations found.
                </div>

            <% } else { %>

                <div class="list-group">

                <% for(ProjectAssignment assignment : assignments){

                    Project project = projectDAO.findById(assignment.getProjectId());
                    if(project == null) continue;
                %>

                <a href="<%= request.getContextPath() %>/message-thread.jsp?projectId=<%= project.getId() %>"
                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">

                    <div>
                        <strong class="text-primary">
                            <%= project.getTitle() %>
                        </strong>
                        <br>
                        <small class="text-muted">Project #<%= project.getId() %></small>
                    </div>

                    <span class="badge bg-secondary rounded-pill">
                        Open Chat <i class="bi bi-chevron-right ms-1"></i>
                    </span>

                </a>

                <% } %>

                </div>

            <% } %>

        </div>

    </div>

</div>

<%@ include file="includes/footer.jsp" %>
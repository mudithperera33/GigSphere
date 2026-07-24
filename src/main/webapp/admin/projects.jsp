<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Manage Projects");
request.setAttribute("activePage", "admin");


// Auth guard for logged in users
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}
if (!"ADMIN".equals(
        session.getAttribute("role")
)) {

    response.sendRedirect(
            request.getContextPath()
                    + "/index.jsp"
    );

    return;
}

ProjectDAO projectDAO = new ProjectDAOImpl();
List<Project> projects = projectDAO.findAll();
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Project Management</h3>
        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="btn btn-outline-secondary btn-sm">
            <i class="bi bi-arrow-left me-1"></i> Back to Dashboard
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <% if (projects == null || projects.isEmpty()) { %>
                <div class="p-4 text-center text-muted">
                    <i class="bi bi-folder-x fs-2 d-block mb-2"></i>
                    No projects found in the system.
                </div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Budget</th>
                                <th>Status</th>
                                <th>Client ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Project project : projects) { %>
                            <tr>
                                <td><strong>#<%= project.getId() %></strong></td>
                                <td><%= project.getTitle() != null ? project.getTitle() : "Untitled" %></td>
                                <td>
                                    LKR <%= String.format("%,.2f", project.getBudget()) %>
                                </td>
                                <td>
                                    <%
                                        String status = project.getStatus() != null ? project.getStatus().toUpperCase() : "UNKNOWN";
                                        String badgeClass = "bg-secondary";

                                        if ("OPEN".equals(status)) {
                                            badgeClass = "bg-success";
                                        } else if ("IN_PROGRESS".equals(status) || "ASSIGNED".equals(status)) {
                                            badgeClass = "bg-primary";
                                        } else if ("COMPLETED".equals(status)) {
                                            badgeClass = "bg-info text-dark";
                                        } else if ("CANCELLED".equals(status)) {
                                            badgeClass = "bg-danger";
                                        }
                                    %>
                                    <span class="badge <%= badgeClass %>">
                                        <%= status %>
                                    </span>
                                </td>
                                <td>
                                    <span class="text-muted">#<%= project.getClientId() %></span>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
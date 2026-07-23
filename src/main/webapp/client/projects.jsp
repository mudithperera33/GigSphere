<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Projects");

if(session.getAttribute("user") == null){
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

Integer userId = (Integer) session.getAttribute("userId");
ProjectDAO dao = new ProjectDAOImpl();
List<Project> projects = dao.findByClientId(userId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>My Projects</h3>

        <a href="<%= request.getContextPath() %>/client/create-project.jsp"
           class="btn btn-primary">
            <i class="bi bi-plus-circle me-2"></i>
            Create Project
        </a>
    </div>

    <div class="card">
        <div class="card-body">

            <% if(projects.isEmpty()){ %>

                <div class="alert alert-info">
                    No projects found. Create your first project to get started.
                </div>

            <% } else { %>

                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>Budget</th>
                        <th>Deadline</th>
                    </tr>
                    </thead>

                    <tbody>
                    <% for(Project project : projects){ %>
                    <tr>
                        <td><%= project.getId() %></td>
                        <td><%= project.getTitle() %></td>

                        <td>
                            <%
                                String status = project.getStatus();
                                String badgeClass = "bg-secondary";

                                if("OPEN".equalsIgnoreCase(status)) {
                                    badgeClass = "bg-success";
                                } else if("IN_PROGRESS".equalsIgnoreCase(status)) {
                                    badgeClass = "bg-primary";
                                } else if("COMPLETED".equalsIgnoreCase(status)) {
                                    badgeClass = "bg-dark";
                                } else if("REVISION_REQUESTED".equalsIgnoreCase(status)) {
                                    badgeClass = "bg-warning text-dark";
                                }
                            %>

                            <span class="badge <%= badgeClass %>">
                                <%= status %>
                            </span>
                        </td>

                        <td>
                            LKR <%= String.format("%,.2f", project.getBudget()) %>
                        </td>
                        <td>

                            <span class="badge bg-secondary">

                                <%= project.getStatus() %>

                            </span>

                        </td>

                        <td>
                            <%= project.getDeadline() %>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

            <% } %>

        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
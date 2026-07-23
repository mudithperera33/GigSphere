<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Browse Projects");
request.setAttribute("activePage", "browse");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp");
    return;
}

ProjectDAO projectDAO = new ProjectDAOImpl();
List<Project> projects = projectDAO.findAll();
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h3 class="mb-4">
        Available Projects
    </h3>

    <div class="row">

        <% if (projects == null || projects.isEmpty()) { %>
            <div class="col-12">
                <div class="alert alert-info shadow-sm">
                    No available projects found at the moment.
                </div>
            </div>
        <% } else { %>
            <% for (Project project : projects) { %>

                <%
                if ("COMPLETED".equalsIgnoreCase(project.getStatus())) {
                    continue;
                }
                %>

            <div class="col-md-6 mb-4">

                <div class="card gs-card-hover h-100 shadow-sm">

                    <div class="card-body d-flex flex-column justify-content-between">

                        <div>
                            <h5 class="card-title">
                                <%= project.getTitle() %>
                            </h5>

                            <p class="card-text text-muted">
                                <%= project.getDescription() %>
                            </p>

                            <p class="mb-1">
                                <strong>Budget:</strong>
                                LKR <%= String.format("%,.2f", project.getBudget()) %>
                            </p>

                            <p class="mb-3">
                                <strong>Status:</strong>
                                <span class="badge bg-success"><%= project.getStatus() %></span>
                            </p>
                        </div>

                        <div>
                            <% if ("OPEN".equalsIgnoreCase(project.getStatus())) { %>

                                <a href="<%= ctx %>/freelancer/proposal.jsp?projectId=<%= project.getId() %>"
                                   class="btn btn-primary w-100">
                                    <i class="bi bi-file-earmark-text me-1"></i>
                                    Submit Proposal
                                </a>

                            <% } else { %>

                                <span class="badge bg-secondary p-2">
                                    <%= project.getStatus() %>
                                </span>

                            <% } %>
                        </div>

                    </div>

                </div>

            </div>

            <% } %>
        <% } %>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
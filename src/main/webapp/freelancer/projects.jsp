<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Browse Projects");

if(session.getAttribute("user") == null){
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
                <div class="alert alert-info">
                    No available projects found at the moment.
                </div>
            </div>
        <% } else { %>
            <% for(Project project : projects){ %>

            <div class="col-md-6 mb-4">

                <div class="card gs-card-hover">

                    <div class="card-body">

                        <h5>
                            <%= project.getTitle() %>
                        </h5>

                        <p>
                            <%= project.getDescription() %>
                        </p>

                        <p>
                            <strong>Budget:</strong>
                            LKR <%= String.format("%,.2f", project.getBudget()) %>
                        </p>

                        <p>
                            <strong>Status:</strong>
                            <span class="badge bg-success"><%= project.getStatus() %></span>
                        </p>

                        <a href="<%= request.getContextPath() %>/freelancer/proposal.jsp?projectId=<%= project.getId() %>"
                           class="btn btn-primary">
                            Submit Proposal
                        </a>

                    </div>

                </div>

            </div>

            <% } %>
        <% } %>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
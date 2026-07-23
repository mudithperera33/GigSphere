<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Client Dashboard");
request.setAttribute("activePage", "dashboard");

if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}

Integer userId = (Integer) session.getAttribute("userId");

ProjectDAO projectDAO = new ProjectDAOImpl();
List<Project> projects = projectDAO.findByClientId(userId);

int totalProjects = (projects != null) ? projects.size() : 0;
int completedProjects = 0;

if (projects != null) {
    for (Project p : projects) {
        if ("COMPLETED".equalsIgnoreCase(p.getStatus())) {
            completedProjects++;
        }
    }
}
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4">Client Dashboard</h2>

    <!-- Stat Cards -->
    <div class="row g-4 mb-4">

        <div class="col-md-6">
            <div class="card text-center shadow-sm h-100">
                <div class="card-body">
                    <div class="text-primary fs-1 mb-2">
                        <i class="bi bi-folder2-open"></i>
                    </div>
                    <h3 class="fw-bold"><%= totalProjects %></h3>
                    <p class="mb-0 text-muted">Total Projects</p>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card text-center shadow-sm h-100">
                <div class="card-body">
                    <div class="text-success fs-1 mb-2">
                        <i class="bi bi-check2-circle"></i>
                    </div>
                    <h3 class="fw-bold"><%= completedProjects %></h3>
                    <p class="mb-0 text-muted">Completed Projects</p>
                </div>
            </div>
        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
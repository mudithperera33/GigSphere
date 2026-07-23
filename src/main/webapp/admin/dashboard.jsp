<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.UserDAO" %>
<%@ page import="com.gigsphere.dao.UserDAOImpl" %>
<%@ page import="com.gigsphere.model.User" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>
<%@ page import="com.gigsphere.dao.ReviewDAO" %>
<%@ page import="com.gigsphere.dao.ReviewDAOImpl" %>
<%@ page import="com.gigsphere.model.Review" %>

<%
request.setAttribute("pageTitle", "Admin Dashboard");
request.setAttribute("activePage", "admin");

// Auth guard
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}

UserDAO userDAO = new UserDAOImpl();
ProjectDAO projectDAO = new ProjectDAOImpl();
ReviewDAO reviewDAO = new ReviewDAOImpl();

List<User> usersList = userDAO.findAll();
List<Project> projectsList = projectDAO.findAll();
List<Review> reviewsList = reviewDAO.findAll();

int totalUsers = (usersList != null) ? usersList.size() : 0;
int totalProjects = (projectsList != null) ? projectsList.size() : 0;
int totalReviews = (reviewsList != null) ? reviewsList.size() : 0;
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4">
        Admin Dashboard
    </h2>

    <!-- Stat Counters -->
    <div class="row g-4 mb-4">

        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <div class="text-primary fs-1 mb-2">
                        <i class="bi bi-people"></i>
                    </div>
                    <h3 class="fw-bold"><%= totalUsers %></h3>
                    <p class="mb-0 text-muted">Total Users</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <div class="text-success fs-1 mb-2">
                        <i class="bi bi-folder2-open"></i>
                    </div>
                    <h3 class="fw-bold"><%= totalProjects %></h3>
                    <p class="mb-0 text-muted">Total Projects</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <div class="text-warning fs-1 mb-2">
                        <i class="bi bi-star"></i>
                    </div>
                    <h3 class="fw-bold"><%= totalReviews %></h3>
                    <p class="mb-0 text-muted">Total Reviews</p>
                </div>
            </div>
        </div>

    </div>

    <!-- Quick Navigation Cards -->
    <div class="row g-4">

        <div class="col-md-4">
            <div class="card text-center shadow-sm h-100">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Users</h5>
                        <p class="card-text text-muted small">View and manage registered platform accounts.</p>
                    </div>
                    <a href="<%= ctx %>/admin/users.jsp" class="btn btn-primary mt-3">
                        <i class="bi bi-people me-1"></i> Manage Users
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm h-100">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Projects</h5>
                        <p class="card-text text-muted small">Inspect active, open, and completed jobs.</p>
                    </div>
                    <a href="<%= ctx %>/admin/projects.jsp" class="btn btn-success mt-3">
                        <i class="bi bi-folder me-1"></i> Manage Projects
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm h-100">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Reviews</h5>
                        <p class="card-text text-muted small">Monitor ratings and feedback submitted by users.</p>
                    </div>
                    <a href="<%= ctx %>/admin/reviews.jsp" class="btn btn-warning mt-3">
                        <i class="bi bi-star me-1"></i> Manage Reviews
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>

<%@ page import="com.gigsphere.dao.ProjectAssignmentDAO" %>
<%@ page import="com.gigsphere.dao.ProjectAssignmentDAOImpl" %>

<%@ page import="com.gigsphere.dao.PortfolioItemDAO" %>
<%@ page import="com.gigsphere.dao.PortfolioItemDAOImpl" %>

<%@ page import="com.gigsphere.dao.ReviewDAO" %>
<%@ page import="com.gigsphere.dao.ReviewDAOImpl" %>

<%@ page import="com.gigsphere.model.Project" %>
<%@ page import="com.gigsphere.model.ProjectAssignment" %>
<%@ page import="com.gigsphere.model.PortfolioItem" %>

<%
request.setAttribute("pageTitle", "Freelancer Dashboard");
request.setAttribute("activePage", "dashboard");

if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}

Integer freelancerId = (Integer) session.getAttribute("userId");

ProjectDAO projectDAO = new ProjectDAOImpl();
ProjectAssignmentDAO assignmentDAO = new ProjectAssignmentDAOImpl();
PortfolioItemDAO portfolioDAO = new PortfolioItemDAOImpl();
ReviewDAO reviewDAO = new ReviewDAOImpl();

/* Assigned Projects */
List<ProjectAssignment> assignments = (freelancerId != null)
        ? assignmentDAO.findByFreelancerId(freelancerId)
        : null;

int assignedProjects = (assignments != null) ? assignments.size() : 0;

/* Completed Projects */
int completedProjects = 0;

if (assignments != null) {
    for (ProjectAssignment assignment : assignments) {
        Project project = projectDAO.findById(assignment.getProjectId());
        if (project != null && "COMPLETED".equalsIgnoreCase(project.getStatus())) {
            completedProjects++;
        }
    }
}

/* Portfolio Items */
List<PortfolioItem> portfolioItems = (freelancerId != null)
        ? portfolioDAO.findByFreelancerId(freelancerId)
        : null;

int portfolioCount = (portfolioItems != null) ? portfolioItems.size() : 0;

/* Average Rating */
double averageRating = (freelancerId != null)
        ? reviewDAO.getAverageRating(freelancerId)
        : 0.0;
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4">
        Freelancer Dashboard
    </h2>

    <!-- Stat Counters -->
    <div class="row g-4 mb-4">

        <div class="col-md-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-briefcase fs-1 text-primary"></i>
                    <h3 class="mt-2"><%= assignedProjects %></h3>
                    <p class="mb-0 text-muted">Assigned Projects</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-check-circle fs-1 text-success"></i>
                    <h3 class="mt-2"><%= completedProjects %></h3>
                    <p class="mb-0 text-muted">Completed Projects</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-collection fs-1 text-info"></i>
                    <h3 class="mt-2"><%= portfolioCount %></h3>
                    <p class="mb-0 text-muted">Portfolio Items</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm text-center h-100">
                <div class="card-body">
                    <i class="bi bi-star-fill fs-1 text-warning"></i>
                    <h3 class="mt-2"><%= String.format("%.1f", averageRating) %></h3>
                    <p class="mb-0 text-muted">Average Rating</p>
                </div>
            </div>
        </div>

    </div>

    <!-- Quick Navigation Actions -->
    <div class="row g-4">

        <div class="col-md-3">
            <div class="card gs-action-card shadow-sm h-100">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Browse Projects</h5>
                        <p class="card-text text-muted small">Find Work</p>
                    </div>
                    <a href="<%= ctx %>/freelancer/projects.jsp" class="btn btn-primary mt-3">
                        <i class="bi bi-search me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card shadow-sm h-100">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Assigned Projects</h5>
                        <p class="card-text text-muted small">Submit Work</p>
                    </div>
                    <a href="<%= ctx %>/freelancer/assigned-projects.jsp" class="btn btn-success mt-3">
                        <i class="bi bi-check2-square me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card shadow-sm h-100">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Portfolio</h5>
                        <p class="card-text text-muted small">Manage Portfolio</p>
                    </div>
                    <a href="<%= ctx %>/freelancer/portfolio.jsp" class="btn btn-info text-white mt-3">
                        <i class="bi bi-folder me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card shadow-sm h-100">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Reviews</h5>
                        <p class="card-text text-muted small">View Ratings</p>
                    </div>
                    <a href="<%= ctx %>/freelancer/reviews.jsp" class="btn btn-warning text-dark mt-3">
                        <i class="bi bi-star me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
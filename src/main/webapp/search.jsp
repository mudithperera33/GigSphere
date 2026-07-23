<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.model.Project" %>

<%
request.setAttribute("pageTitle", "Search Results");
request.setAttribute("activePage", "search");

@SuppressWarnings("unchecked")
List<Project> results = (List<Project>) request.getAttribute("results");

String keyword = (String) request.getAttribute("keyword");

if (keyword == null) {
    keyword = "";
}
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Search Results</h3>
    </div>

    <% if (!keyword.trim().isEmpty()) { %>
        <p class="text-muted mb-4">
            Showing results for keyword: <strong><%= keyword %></strong>
        </p>
    <% } %>

    <% if (results == null || results.isEmpty()) { %>

        <div class="alert alert-info d-flex align-items-center" role="alert">
            <i class="bi bi-info-circle-fill me-2 fs-5"></i>
            <div>
                No projects found matching "<strong><%= keyword %></strong>". Try searching with different keywords.
            </div>
        </div>

    <% } else { %>

        <div class="row">
            <% for (Project project : results) { %>
                <div class="col-12 mb-3">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="card-title mb-0 fw-bold">
                                    <%= project.getTitle() != null ? project.getTitle() : "Untitled Project" %>
                                </h5>

                                <%
                                    String status = project.getStatus() != null ? project.getStatus().toUpperCase() : "OPEN";
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
                            </div>

                            <p class="card-text text-secondary mb-3">
                                <%= project.getDescription() != null ? project.getDescription() : "No description provided." %>
                            </p>

                            <div class="d-flex justify-content-between align-items-center pt-2 border-top">
                                <span class="fw-semibold text-dark">
                                    <i class="bi bi-cash-stack me-1 text-success"></i>
                                    Budget: LKR <%= String.format("%,.2f", project.getBudget()) %>
                                </span>

                                <a href="<%= ctx %>/freelancer/projects.jsp?id=<%= project.getId() %>" class="btn btn-outline-primary btn-sm">
                                    View Details
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            <% } %>
        </div>

    <% } %>

</div>

<%@ include file="includes/footer.jsp" %>
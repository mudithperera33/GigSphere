<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ReviewDAO" %>
<%@ page import="com.gigsphere.dao.ReviewDAOImpl" %>
<%@ page import="com.gigsphere.model.Review" %>

<%
request.setAttribute("pageTitle", "Manage Reviews");
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

ReviewDAO reviewDAO = new ReviewDAOImpl();
List<Review> reviews = reviewDAO.findAll();
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Review Management</h3>
        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="btn btn-outline-secondary btn-sm">
            <i class="bi bi-arrow-left me-1"></i> Back to Dashboard
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <% if (reviews == null || reviews.isEmpty()) { %>
                <div class="p-4 text-center text-muted">
                    <i class="bi bi-star-slash fs-2 d-block mb-2"></i>
                    No reviews found in the system.
                </div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Project ID</th>
                                <th>Reviewer ID</th>
                                <th>Reviewee ID</th>
                                <th>Rating</th>
                                <th>Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Review review : reviews) { %>
                            <tr>
                                <td><strong>#<%= review.getId() %></strong></td>
                                <td><span class="text-muted">#<%= review.getProjectId() %></span></td>
                                <td><span class="text-muted">#<%= review.getReviewerId() %></span></td>
                                <td><span class="text-muted">#<%= review.getRevieweeId() %></span></td>
                                <td>
                                    <span class="badge bg-warning text-dark">
                                        <i class="bi bi-star-fill me-1"></i><%= review.getRating() %>/5
                                    </span>
                                </td>
                                <td>
                                    <%= (review.getComment() != null && !review.getComment().trim().isEmpty())
                                            ? review.getComment()
                                            : "<em class=\"text-muted\">No comment provided</em>" %>
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
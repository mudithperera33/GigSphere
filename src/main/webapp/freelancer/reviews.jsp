<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ReviewDAO" %>
<%@ page import="com.gigsphere.dao.ReviewDAOImpl" %>
<%@ page import="com.gigsphere.model.Review" %>

<%
    request.setAttribute("pageTitle", "Reviews");

    if(session.getAttribute("user") == null){
        response.sendRedirect(
                request.getContextPath()
                        + "/auth/login.jsp");
        return;
    }

    Integer userId = (Integer) session.getAttribute("userId");

    ReviewDAO reviewDAO = new ReviewDAOImpl();

    List<Review> reviews = reviewDAO.findByUserId(userId);
    double averageRating = reviewDAO.getAverageRating(userId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="card mb-4 shadow-sm">

        <div class="card-body d-flex justify-content-between align-items-center">

            <div>
                <h3 class="mb-1">My Reviews</h3>
                <p class="text-muted mb-0">Ratings and feedback from clients you've worked with</p>
            </div>

            <div class="text-end">
                <span class="fs-4 fw-bold text-warning">
                    <%= String.format("%.2f", averageRating) %> <i class="bi bi-star-fill"></i>
                </span>
                <div class="text-muted small">Overall Average</div>
            </div>

        </div>

    </div>

    <% if(reviews == null || reviews.isEmpty()){ %>

    <div class="alert alert-info">
        <i class="bi bi-info-circle me-1"></i> No reviews available yet.
    </div>

    <% } else { %>

    <% for(Review review : reviews){ %>

    <div class="card mb-3 gs-card-hover">

        <div class="card-body">

            <div class="d-flex justify-content-between align-items-center mb-2">

                <h5 class="mb-0 text-warning">
                    <%= review.getRating() %>/5 <i class="bi bi-star-fill ms-1"></i>
                </h5>

                <small class="text-muted">
                    Reviewer ID: #<%= review.getReviewerId() %>
                </small>

            </div>

            <p class="card-text text-secondary mb-0">
                <%= review.getComment() %>
            </p>

        </div>

    </div>

    <% } %>

    <% } %>

</div>

<%@ include file="../includes/footer.jsp" %>
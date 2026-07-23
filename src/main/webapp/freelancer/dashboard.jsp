<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
request.setAttribute("pageTitle", "Freelancer Dashboard");
request.setAttribute("activePage", "dashboard");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="row g-4">

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>Browse Projects</h5>
                        <p class="text-muted small">Find Work</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/freelancer/projects.jsp" class="btn btn-primary w-100">
                        <i class="bi bi-search me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>My Proposals</h5>
                        <p class="text-muted small">View Bids</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/freelancer/proposal.jsp" class="btn btn-secondary w-100">
                        <i class="bi bi-send me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>Assigned Projects</h5>
                        <p class="text-muted small">Submit Work</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/freelancer/assigned-projects.jsp" class="btn btn-success w-100">
                        <i class="bi bi-journal-check me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>Portfolio</h5>
                        <p class="text-muted small">Manage Portfolio</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/freelancer/portfolio.jsp" class="btn btn-info text-white w-100">
                        <i class="bi bi-images me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>Reviews</h5>
                        <p class="text-muted small">View Ratings</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/freelancer/reviews.jsp" class="btn btn-warning text-dark w-100">
                        <i class="bi bi-star me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card h-100 shadow-sm">
                <div class="card-body text-center d-flex flex-column justify-content-between">
                    <div>
                        <h5>Messages</h5>
                        <p class="text-muted small">Communicate</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/messages.jsp" class="btn btn-dark w-100">
                        <i class="bi bi-chat-dots me-1"></i> Open
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
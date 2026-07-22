<%
    request.setAttribute("pageTitle", "Dashboard");
    request.setAttribute("activePage", "dashboard");

    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <!-- Overview Stat Cards -->
    <div class="row g-4">
        <div class="col-md-4">
            <div class="gs-stat-card">
                <h6>Welcome</h6>
                <div class="gs-stat-value">
                    ${sessionScope.user}
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="gs-stat-card">
                <h6>Active Role</h6>
                <div class="gs-stat-value">
                    ${sessionScope.role}
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="gs-stat-card">
                <h6>User ID</h6>
                <div class="gs-stat-value">
                    ${sessionScope.userId}
                </div>
            </div>
        </div>
    </div>

    <!-- Action Cards -->
    <div class="row mt-4 g-4">
        <div class="col-md-3">
            <div class="card gs-action-card">
                <div class="card-body text-center">
                    <h5>Projects</h5>
                    <p>Manage Projects</p>
                    <a href="${pageContext.request.contextPath}/projects.jsp" class="btn btn-primary">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card">
                <div class="card-body text-center">
                    <h5>Proposals</h5>
                    <p>View Proposals</p>
                    <a href="${pageContext.request.contextPath}/proposals.jsp" class="btn btn-secondary">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card">
                <div class="card-body text-center">
                    <h5>Messages</h5>
                    <p>Project Communication</p>
                    <a href="${pageContext.request.contextPath}/messages.jsp" class="btn btn-warning">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card gs-action-card">
                <div class="card-body text-center">
                    <h5>Portfolio</h5>
                    <p>Manage Portfolio</p>
                    <a href="${pageContext.request.contextPath}/portfolio.jsp" class="btn btn-info">
                        Open
                    </a>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="includes/footer.jsp" %>
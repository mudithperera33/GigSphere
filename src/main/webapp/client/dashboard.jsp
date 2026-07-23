<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
request.setAttribute("pageTitle", "Client Dashboard");
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
                        <h5>Projects</h5>
                        <p class="text-muted small">Manage Projects</p>
                    </div>

                    <a href="<%= request.getContextPath() %>client/projects.jsp"
                       class="btn btn-primary w-100">
                        <i class="bi bi-folder2-open me-1"></i> Open
                    </a>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card gs-action-card h-100 shadow-sm">

                <div class="card-body text-center d-flex flex-column justify-content-between">

                    <div>
                        <h5>Proposals</h5>
                        <p class="text-muted small">Review Proposals</p>
                    </div>

                    <a href="<%= request.getContextPath() %>/client/proposals.jsp"
                       class="btn btn-secondary w-100">
                        <i class="bi bi-file-earmark-text me-1"></i> Open
                    </a>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card gs-action-card h-100 shadow-sm">

                <div class="card-body text-center d-flex flex-column justify-content-between">

                    <div>
                        <h5>Submissions</h5>
                        <p class="text-muted small">Review Work</p>
                    </div>

                    <a href="<%= request.getContextPath() %>/client/submissions.jsp"
                       class="btn btn-success w-100">
                        <i class="bi bi-check-all me-1"></i> Open
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

                    <a href="<%= request.getContextPath() %>/messages.jsp"
                       class="btn btn-warning text-dark w-100">
                        <i class="bi bi-chat-dots me-1"></i> Open
                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
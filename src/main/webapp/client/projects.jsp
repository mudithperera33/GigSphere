<%
    request.setAttribute("pageTitle", "Projects");
    request.setAttribute("activePage", "projects");

    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>My Projects</h3>
        <a href="${pageContext.request.contextPath}/projects/create.jsp" class="btn btn-primary">
            Create Project
        </a>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Budget</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Sample Project</td>
                    <td>
                            <span class="badge gs-status-open">
                                OPEN
                            </span>
                    </td>
                    <td>LKR 50,000</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
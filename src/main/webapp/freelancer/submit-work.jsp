<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
request.setAttribute("pageTitle", "Submit Work");
request.setAttribute("activePage", "assigned");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

String projectId = request.getParameter("projectId");

if (projectId == null || projectId.trim().isEmpty()) {
    response.sendRedirect(
            request.getContextPath()
                    + "/freelancer/assigned-projects.jsp"
    );
    return;
}
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="card shadow-sm">

                <div class="card-body">

                    <h3 class="mb-4">
                        Submit Project Work
                    </h3>

                    <form action="<%= ctx %>/submit-work" method="post">

                        <input type="hidden"
                               name="projectId"
                               value="<%= projectId %>">

                        <div class="mb-3">

                            <label class="form-label">
                                File Name
                            </label>

                            <input type="text"
                                   name="fileName"
                                   class="form-control"
                                   placeholder="project-final.zip"
                                   required>

                            <div class="form-text">
                                Enter the name or link of the submitted work file.
                            </div>

                        </div>

                        <div class="d-flex gap-2">

                            <button type="submit"
                                    class="btn btn-primary">
                                <i class="bi bi-upload me-1"></i>
                                Submit Work
                            </button>

                            <a href="<%= ctx %>/freelancer/assigned-projects.jsp"
                               class="btn btn-secondary">
                                Cancel
                            </a>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
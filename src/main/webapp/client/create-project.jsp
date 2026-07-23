<%
request.setAttribute("pageTitle", "Create Project");

if(session.getAttribute("user") == null){
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp");
    return;
}
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">
    <div class="card">
        <div class="card-body">
            <h3>Create Project</h3>

            <form action="<%= request.getContextPath() %>/create-project" method="post">

                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text"
                           name="title"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description"
                              class="form-control"
                              rows="4"
                              required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Budget</label>
                    <input type="number"
                           step="0.01"
                           name="budget"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Deadline</label>
                    <input type="date"
                           name="deadline"
                           class="form-control"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Category ID</label>
                    <input type="number"
                           name="categoryId"
                           class="form-control"
                           required>
                </div>

                <button type="submit" class="btn btn-primary">
                    Create Project
                </button>

            </form>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
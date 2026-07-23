<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setAttribute("pageTitle", "Add Portfolio Item");

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

            <h3 class="mb-4">Add Portfolio Item</h3>

            <form action="<%= request.getContextPath() %>/add-portfolio" method="post">

                <div class="mb-3">
                    <label class="form-label">
                        Title
                    </label>
                    <input type="text"
                           name="title"
                           class="form-control"
                           placeholder="e.g. E-Commerce Mobile App"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        Description
                    </label>

                    <textarea
                            name="description"
                            class="form-control"
                            rows="4"
                            placeholder="Describe what you built, technologies used, and your key contributions..."
                            required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        Category
                    </label>
                    <input type="text"
                           name="category"
                           class="form-control"
                           placeholder="e.g. Web Development, UI/UX, Mobile"
                           required>
                </div>

                <button type="submit"
                        class="btn btn-success">
                    Save
                </button>

                <a href="<%= request.getContextPath() %>/freelancer/portfolio.jsp"
                   class="btn btn-outline-secondary ms-2">
                    Cancel
                </a>

            </form>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
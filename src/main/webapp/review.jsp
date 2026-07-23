<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setAttribute("pageTitle", "Leave Review");

    if(session.getAttribute("user") == null){
        response.sendRedirect(
                request.getContextPath()
                        + "/auth/login.jsp");
        return;
    }

    String revieweeId = request.getParameter("revieweeId");
    String projectId = request.getParameter("projectId");
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <div class="card col-md-8 mx-auto">

        <div class="card-body">

            <h3 class="mb-4">Leave Review</h3>

            <form action="<%= request.getContextPath() %>/submit-review" method="post">

                <input type="hidden"
                       name="revieweeId"
                       value="<%= revieweeId != null ? revieweeId : "" %>">

                <input type="hidden"
                       name="projectId"
                       value="<%= projectId != null ? projectId : "" %>">

                <div class="mb-3">

                    <label class="form-label fw-bold">
                        Rating
                    </label>

                    <select name="rating"
                            class="form-select"
                            required>

                        <option value="5" selected>5 Stars - Excellent</option>
                        <option value="4">4 Stars - Very Good</option>
                        <option value="3">3 Stars - Average</option>
                        <option value="2">2 Stars - Poor</option>
                        <option value="1">1 Star - Very Poor</option>

                    </select>

                </div>

                <div class="mb-3">

                    <label class="form-label fw-bold">
                        Comment
                    </label>

                    <textarea name="comment"
                              class="form-control"
                              rows="4"
                              placeholder="Describe your experience working together..."
                              required></textarea>

                </div>

                <button type="submit"
                        class="btn btn-success">
                    Submit Review
                </button>

                <a href="<%= request.getContextPath() %>/dashboard.jsp"
                   class="btn btn-outline-secondary ms-2">
                    Cancel
                </a>

            </form>

        </div>

    </div>

</div>

<%@ include file="includes/footer.jsp" %>
<%
request.setAttribute("pageTitle", "Submit Proposal");

String projectId = request.getParameter("projectId");

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

            <h3 class="mb-4">Submit Proposal</h3>

            <form action="<%= request.getContextPath() %>/submit-proposal" method="post">

                <input type="hidden"
                       name="projectId"
                       value="<%= projectId %>">

                <div class="mb-3">

                    <label class="form-label">
                        Cover Letter
                    </label>

                    <textarea
                            name="coverLetter"
                            class="form-control"
                            rows="5"
                            required></textarea>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        Bid Amount (LKR)
                    </label>

                    <input type="number"
                           step="0.01"
                           name="bidAmount"
                           class="form-control"
                           required>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        Expected Days
                    </label>

                    <input type="number"
                           min="1"
                           name="expectedDays"
                           class="form-control"
                           required>

                </div>

                <button type="submit"
                        class="btn btn-success">

                    Submit Proposal

                </button>

            </form>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
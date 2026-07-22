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
    <div class="card">
        <div class="card-body">
            <h2>Welcome, ${sessionScope.user}</h2>
            <p>Role: ${sessionScope.role}</p>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
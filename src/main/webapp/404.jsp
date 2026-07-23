<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<%
request.setAttribute("pageTitle", "Page Not Found");
%>

<%@ include file="includes/header.jsp" %>

<div class="container text-center mt-5 mb-5 py-5">

    <div class="mb-3 text-warning">
        <i class="bi bi-exclamation-triangle-fill display-1"></i>
    </div>

    <h1 class="display-1 fw-bold">404</h1>

    <h3 class="fw-semibold">Page Not Found</h3>

    <p class="text-secondary lead mb-4">
        The page you are looking for doesn't exist or has been moved.
    </p>

    <a href="<%= ctx %>/index.jsp" class="btn btn-primary btn-lg">
        <i class="bi bi-house-door me-1"></i> Back to Home
    </a>

</div>

<%@ include file="includes/footer.jsp" %>
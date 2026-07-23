<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<%
request.setAttribute("pageTitle", "Server Error");
%>

<%@ include file="includes/header.jsp" %>

<div class="container text-center mt-5 mb-5 py-5">

    <div class="mb-3 text-danger">
        <i class="bi bi-x-circle-fill display-1"></i>
    </div>

    <h1 class="display-1 fw-bold text-danger">500</h1>

    <h3 class="fw-semibold">Internal Server Error</h3>

    <p class="text-secondary lead mb-4">
        Something went wrong on our end. Please try again later or contact support.
    </p>

    <a href="<%= ctx %>/index.jsp" class="btn btn-primary btn-lg">
        <i class="bi bi-house-door me-1"></i> Back to Home
    </a>

</div>

<%@ include file="includes/footer.jsp" %>
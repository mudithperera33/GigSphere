<%
    request.setAttribute("pageTitle", "Home");
    request.setAttribute("activePage", "home");
%>
<%@ include file="includes/header.jsp" %>

<div class="container mt-5">

    <div class="p-5 gs-hero">

        <h1 class="display-4 fw-bold">
            Welcome To GigSphere
        </h1>

        <p class="lead">
            Connect with talented freelancers and professional clients.
        </p>

        <a href="<%= request.getContextPath() %>/auth/register.jsp"
           class="btn btn-light btn-lg">
            Get Started
        </a>

    </div>

</div>

<%@ include file="includes/footer.jsp" %>

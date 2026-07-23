<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// 1. Check if user is logged in
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}

// 2. Route based on user role
String role = (String) session.getAttribute("role");

if ("CLIENT".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/client/dashboard.jsp");
    return;
}

if ("FREELANCER".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/freelancer/dashboard.jsp");
    return;
}

// 3. Fallback redirect for unknown or unhandled roles
response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
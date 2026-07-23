<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

String role = (String) session.getAttribute("role");

if ("CLIENT".equalsIgnoreCase(role)) {
    response.sendRedirect(
            request.getContextPath()
                    + "/client/dashboard.jsp"
    );
} else if ("FREELANCER".equalsIgnoreCase(role)) {
    response.sendRedirect(
            request.getContextPath()
                    + "/freelancer/dashboard.jsp"
    );
} else {
    response.getWriter().println(
            "Please activate a role first."
    );
}
%>
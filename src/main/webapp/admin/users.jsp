<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.UserDAO" %>
<%@ page import="com.gigsphere.dao.UserDAOImpl" %>
<%@ page import="com.gigsphere.model.User" %>

<%
request.setAttribute("pageTitle", "Manage Users");
request.setAttribute("activePage", "admin");

// Auth guard for logged in users
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    return;
}
if (!"ADMIN".equals(
        session.getAttribute("role")
)) {

    response.sendRedirect(
            request.getContextPath()
                    + "/index.jsp"
    );

    return;
}

UserDAO userDAO = new UserDAOImpl();
List<User> users = userDAO.findAll();
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>User Management</h3>
        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp" class="btn btn-outline-secondary btn-sm">
            <i class="bi bi-arrow-left me-1"></i> Back to Dashboard
        </a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <% if (users == null || users.isEmpty()) { %>
                <div class="p-4 text-center text-muted">
                    <i class="bi bi-people fs-2 d-block mb-2"></i>
                    No registered users found.
                </div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (User user : users) { %>
                            <tr>
                                <td><strong>#<%= user.getId() %></strong></td>
                                <td><%= user.getName() != null ? user.getName() : "N/A" %></td>
                                <td><%= user.getEmail() != null ? user.getEmail() : "N/A" %></td>
                                <td>
                                    <i class="bi bi-geo-alt me-1 text-muted"></i>
                                    <%= user.getLocation() != null ? user.getLocation() : "Not specified" %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.NotificationDAO" %>
<%@ page import="com.gigsphere.dao.NotificationDAOImpl" %>
<%@ page import="com.gigsphere.model.Notification" %>

<%
request.setAttribute("pageTitle", "Notifications");
request.setAttribute("activePage", "notifications");

if (session.getAttribute("user") == null) {
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

Integer userId = (Integer) session.getAttribute("userId");

NotificationDAO notificationDAO = new NotificationDAOImpl();
List<Notification> notifications = notificationDAO.findByUserId(userId);
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <div class="card shadow-sm">

        <div class="card-body">

            <h3 class="mb-4">
                Notifications
            </h3>

            <% if (notifications == null || notifications.isEmpty()) { %>

                <div class="alert alert-info shadow-sm mb-0">
                    <i class="bi bi-bell-slash me-2"></i>
                    No notifications available.
                </div>

            <% } else { %>

                <% for (Notification notification : notifications) { %>

                <div class="border rounded p-3 mb-3 bg-light-subtle">

                    <div class="d-flex justify-content-between align-items-center">

                        <strong class="text-primary">
                            <i class="bi bi-bell me-1"></i>
                            <%= notification.getType() %>
                        </strong>

                        <small class="text-muted">
                            <i class="bi bi-clock me-1"></i>
                            <%= notification.getCreatedAt() %>
                        </small>

                    </div>

                    <p class="mb-0 mt-2 text-dark">
                        <%= notification.getMessage() %>
                    </p>

                </div>

                <% } %>

            <% } %>

        </div>

    </div>

</div>

<%@ include file="includes/footer.jsp" %>
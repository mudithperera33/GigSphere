<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gigsphere.dao.NotificationDAO" %>
<%@ page import="com.gigsphere.dao.NotificationDAOImpl" %>
<%@ page import="com.gigsphere.model.Notification" %>
<%@ page import="java.util.List" %>

<%
String pageTitle =
        request.getAttribute("pageTitle") != null
                ? (String) request.getAttribute("pageTitle")
                : "GigSphere";

String activePage =
        request.getAttribute("activePage") != null
                ? (String) request.getAttribute("activePage")
                : "";

String ctx = request.getContextPath();

String sessUser =
        (String) session.getAttribute("user");

String sessRole =
        (String) session.getAttribute("role");

boolean loggedIn =
        sessUser != null;

int notificationCount = 0;

if (session.getAttribute("userId") != null) {
    Integer headerUserId = (Integer) session.getAttribute("userId");
    NotificationDAO headerNotificationDAO = new NotificationDAOImpl();
    List<Notification> headerNotifications = headerNotificationDAO.findByUserId(headerUserId);

    if (headerNotifications != null) {
        notificationCount = headerNotifications.size();
    }
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title><%= pageTitle %> | GigSphere</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <link href="<%= ctx %>/assets/css/style.css"
          rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark gs-navbar sticky-top">

    <div class="container">

        <a class="navbar-brand" href="<%= ctx %>/index.jsp">
            <i class="bi bi-lightning-charge-fill me-1"></i>
            GigSphere
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#gsNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse"
             id="gsNavbar">

            <ul class="navbar-nav me-auto">

                <% if (!loggedIn) { %>

                <li class="nav-item">
                    <a class="nav-link <%= "home".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/index.jsp">
                        Home
                    </a>
                </li>


                <% } else if ("CLIENT".equalsIgnoreCase(sessRole)) { %>

                <li class="nav-item">
                    <a class="nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/client/dashboard.jsp">
                        Dashboard
                    </a>
                </li>

                <form action="<%= ctx %>/search" method="get" class="d-flex me-3" role="search">

                    <input type="search"
                           name="keyword"
                           class="form-control form-control-sm"
                           placeholder="Search projects"
                           aria-label="Search projects">

                </form>

                <li class="nav-item">
                    <a class="nav-link <%= "projects".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/client/projects.jsp">
                        Projects
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "proposals".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/client/proposals.jsp">
                        Proposals
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "submissions".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/client/submissions.jsp">
                        Submissions
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "messages".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/messages.jsp">
                        Messages
                    </a>
                </li>

                <% } else if ("FREELANCER".equalsIgnoreCase(sessRole)) { %>

                <li class="nav-item">
                    <a class="nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/dashboard.jsp">
                        Dashboard
                    </a>
                </li>
                <form action="<%= ctx %>/search" method="get" class="d-flex me-3" role="search">

                                    <input type="search"
                                           name="keyword"
                                           class="form-control form-control-sm"
                                           placeholder="Search projects"
                                           aria-label="Search projects">

                                </form>

                <li class="nav-item">
                    <a class="nav-link <%= "projects".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/projects.jsp">
                        Browse Projects
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "proposals".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/proposal.jsp">
                        My Proposals
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "assigned".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/assigned-projects.jsp">
                        Assigned Projects
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "portfolio".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/portfolio.jsp">
                        Portfolio
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "reviews".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/freelancer/reviews.jsp">
                        Reviews
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= "messages".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/messages.jsp">
                        Messages
                    </a>
                </li>

                <% } %>

            </ul>
            <ul class="navbar-nav me-auto">

                <% if (!loggedIn) { %>

                <li class="nav-item">
                    <a class="nav-link <%= "home".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/index.jsp">
                        Home
                    </a>
                </li>

                <% } else if ("CLIENT".equalsIgnoreCase(sessRole)) { %>

                    <!-- Client navigation items -->
                    ...

                <% } else if ("FREELANCER".equalsIgnoreCase(sessRole)) { %>

                    <!-- Freelancer navigation items -->
                    ...

                <% } else if ("ADMIN".equalsIgnoreCase(sessRole)) { %>

                <li class="nav-item">
                    <a class="nav-link <%= "admin".equals(activePage) ? "active" : "" %>"
                       href="<%= ctx %>/admin/dashboard.jsp">
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="<%= ctx %>/admin/users.jsp">
                        Users
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="<%= ctx %>/admin/projects.jsp">
                        Projects
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="<%= ctx %>/admin/reviews.jsp">
                        Reviews
                    </a>
                </li>

                <% } %>

            </ul>

            <ul class="navbar-nav ms-auto align-items-center">

                <% if (!loggedIn) { %>

                <li class="nav-item">
                    <a class="nav-link" href="<%= ctx %>/auth/login.jsp">
                        Login
                    </a>
                </li>

                <li class="nav-item ms-lg-2">
                    <a class="btn btn-outline-light btn-sm" href="<%= ctx %>/auth/register.jsp">
                        Sign Up
                    </a>
                </li>

                <% } else { %>

                <li class="nav-item me-3">

                    <a class="nav-link position-relative" href="<%= ctx %>/notifications.jsp">

                        <i class="bi bi-bell fs-5"></i>

                        <% if (notificationCount > 0) { %>

                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                <%= notificationCount %>
                                <span class="visually-hidden">unread notifications</span>
                            </span>

                        <% } %>

                    </a>

                </li>

                <li class="nav-item dropdown">

                   <a class="nav-link dropdown-toggle d-flex align-items-center gap-2"
                      href="#"
                      role="button"
                      data-bs-toggle="dropdown"
                      aria-expanded="false">

                       <span class="badge rounded-circle bg-primary p-2">
                           <%= sessUser.substring(0, 1).toUpperCase() %>
                       </span>

                       <span>
                           <%= sessUser %>
                       </span>

                   </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>
                            <span class="dropdown-item-text text-muted small">
                                Current Role: <strong><%= sessRole %></strong>
                            </span>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item" href="<%= ctx %>/activate-client">
                                Activate Client Profile
                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item" href="<%= ctx %>/activate-freelancer">
                                Activate Freelancer Profile
                            </a>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item text-danger" href="<%= ctx %>/logout">
                                <i class="bi bi-box-arrow-right me-1"></i> Logout
                            </a>
                        </li>

                    </ul>

                </li>

                <% } %>

            </ul>

        </div>

    </div>

</nav>

<%
String flashSuccess =
        (String) session.getAttribute("flashSuccess");

String flashError =
        (String) session.getAttribute("flashError");

if (flashSuccess != null) {
    session.removeAttribute("flashSuccess");
}

if (flashError != null) {
    session.removeAttribute("flashError");
}
%>

<% if (flashSuccess != null) { %>

<div class="container mt-3">

    <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">

        <%= flashSuccess %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

</div>

<% } %>

<% if (flashError != null) { %>

<div class="container mt-3">

    <div class="alert alert-danger alert-dismissible fade show mb-0" role="alert">

        <%= flashError %>

        <button type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close">
        </button>

    </div>

</div>

<% } %>

<main class="gs-main">
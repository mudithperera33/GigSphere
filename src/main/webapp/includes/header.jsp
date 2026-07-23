<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Shared header/navbar for GigSphere.
    Include at the TOP of every page like this:
        <%@ include file="../includes/header.jsp" %>   (from a subfolder e.g. /auth, /client, /freelancer, /admin)
        <%@ include file="includes/header.jsp" %>       (from webapp root, e.g. index.jsp)

    Expects (optional, set these BEFORE the include if you want them):
        pageTitle   - String, title shown in <title> and as the auto-generated <h2> page heading
        activePage  - String, used to highlight the active nav link (e.g. "dashboard", "projects")

    Reads from session (set these during login):
        session.getAttribute("user")   - logged-in user's display name
        session.getAttribute("role")   - "CLIENT" | "FREELANCER" | "ADMIN"
        session.getAttribute("userId") - logged-in user's id
--%>
<%
    String pageTitle =
            (request.getAttribute("pageTitle") != null)
                    ? (String) request.getAttribute("pageTitle")
                    : "GigSphere";

    String activePage =
            (request.getAttribute("activePage") != null)
                    ? (String) request.getAttribute("activePage")
                    : "";

    String ctx =
            request.getContextPath();

    String sessUser =
            (session.getAttribute("user") != null)
                    ? (String) session.getAttribute("user")
                    : null;

    String sessRole =
            (session.getAttribute("role") != null)
                    ? (String) session.getAttribute("role")
                    : null;

    boolean loggedIn =
            (sessUser != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><%= pageTitle %> | GigSphere</title>

    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
            rel="stylesheet">

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
            rel="stylesheet">

    <!-- GigSphere CSS -->
    <link
            href="<%= ctx %>/assets/css/style.css"
            rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark gs-navbar sticky-top">
    <div class="container">

        <a class="navbar-brand" href="<%= ctx %>/index.jsp">
            <i class="bi bi-lightning-charge-fill"></i>
            GigSphere
        </a>

        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#gsNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="gsNavbar">

            <!-- LEFT MENU -->
            <ul class="navbar-nav me-auto">

                <% if (!loggedIn) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("home") ? "active" : "" %>"
                           href="<%= ctx %>/index.jsp">
                            Home
                        </a>
                    </li>

                <% } else if ("CLIENT".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("dashboard") ? "active" : "" %>"
                           href="<%= ctx %>/client/dashboard.jsp">
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("projects") ? "active" : "" %>"
                           href="<%= ctx %>/client/projects.jsp">
                            My Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("proposals") ? "active" : "" %>"
                           href="<%= ctx %>/client/proposals.jsp">
                            Proposals
                        </a>
                    </li>

                <% } else if ("FREELANCER".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("dashboard") ? "active" : "" %>"
                           href="<%= ctx %>/freelancer/dashboard.jsp">
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("projects") ? "active" : "" %>"
                           href="<%= ctx %>/freelancer/projects.jsp">
                            Browse Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("portfolio") ? "active" : "" %>"
                           href="<%= ctx %>/freelancer/portfolio.jsp">
                            Portfolio
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("messages") ? "active" : "" %>"
                           href="<%= ctx %>/freelancer/messages.jsp">
                            Messages
                        </a>
                    </li>

                <% } else if ("ADMIN".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("dashboard") ? "active" : "" %>"
                           href="<%= ctx %>/admin/dashboard.jsp">
                            Admin Dashboard
                        </a>
                    </li>

                <% } %>

            </ul>

            <!-- SEARCH BAR -->
            <% if (loggedIn) { %>
                <form action="<%= ctx %>/search" method="get" class="d-flex me-3">
                    <input
                            class="form-control form-control-sm"
                            type="search"
                            name="keyword"
                            placeholder="Search Projects">
                </form>
            <% } %>

            <!-- RIGHT MENU -->
            <ul class="navbar-nav ms-auto align-items-center">

                <% if (!loggedIn) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= activePage.equals("login") ? "active" : "" %>"
                           href="<%= ctx %>/auth/login.jsp">
                            Login
                        </a>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <a class="btn btn-light btn-sm gs-btn-cta" href="<%= ctx %>/auth/register.jsp">
                            Sign Up
                        </a>
                    </li>

                <% } else { %>

                    <!-- Notifications -->
                    <li class="nav-item me-3 position-relative">
                        <a class="nav-link" href="<%= ctx %>/notifications.jsp">
                            <i class="bi bi-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger gs-notification-badge">
                                3
                            </span>
                        </a>
                    </li>

                    <!-- Profile Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center gap-2"
                           href="#" role="button" data-bs-toggle="dropdown">
                            <span class="gs-avatar">
                                <%= sessUser.substring(0,1).toUpperCase() %>
                            </span>
                            <span><%= sessUser %></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <span class="dropdown-item-text text-muted small"><%= sessRole %></span>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item" href="<%= ctx %>/profile.jsp">
                                    <i class="bi bi-person me-2"></i>Profile
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item" href="<%= ctx %>/activate-client">
                                    <i class="bi bi-briefcase me-2"></i>
                                    Activate Client Profile
                                </a>
                            </li>

                            <li>
                                <a class="dropdown-item" href="<%= ctx %>/activate-freelancer">
                                    <i class="bi bi-person-workspace me-2"></i>
                                    Activate Freelancer Profile
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item text-danger" href="<%= ctx %>/logout">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                                </a>
                            </li>
                        </ul>
                    </li>

                <% } %>

            </ul>

        </div>
    </div>
</nav>

<%-- Flash / status messages set by servlets via session before redirect --%>
<%
    String flashSuccess = (String) session.getAttribute("flashSuccess");
    String flashError = (String) session.getAttribute("flashError");
    if (flashSuccess != null) session.removeAttribute("flashSuccess");
    if (flashError != null) session.removeAttribute("flashError");
%>
<% if (flashSuccess != null) { %>
    <div class="container mt-3">
        <div class="alert alert-success alert-dismissible fade show gs-alert">
            <i class="bi bi-check-circle-fill me-2"></i><%= flashSuccess %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
<% } %>
<% if (flashError != null) { %>
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show gs-alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i><%= flashError %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
<% } %>

<main class="gs-main">
    <div class="container mt-4">
        <h2 class="gs-page-heading"><%= pageTitle %></h2>

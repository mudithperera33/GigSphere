<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gigsphere.dao.NotificationDAO" %>
<%@ page import="com.gigsphere.dao.NotificationDAOImpl" %>
<%@ page import="com.gigsphere.model.Notification" %>
<%@ page import="java.util.List" %>

<%
String pageTitle = request.getAttribute("pageTitle") != null
        ? (String) request.getAttribute("pageTitle")
        : "GigSphere";

String activePage = request.getAttribute("activePage") != null
        ? (String) request.getAttribute("activePage")
        : "";

String ctx = request.getContextPath();
String sessUser = (String) session.getAttribute("user");
String sessRole = (String) session.getAttribute("role");
boolean loggedIn = sessUser != null;

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
<html lang="en" class="dark-theme">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= pageTitle %> | GigSphere</title>

    <!-- Bootstrap 5 & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Cyberpunk & Sci-Fi Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;600&family=Orbitron:wght@600;800&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Global GigSphere Theme (sticky-footer layout, dark tiles, overrides) -->
    <link href="<%= ctx %>/assets/css/style.css?v=2.2" rel="stylesheet">

    <!-- Futuristic Glassmorphism CSS -->
    <style>
        :root {
            --bg-dark: #07090e;
            --surface-glass: rgba(15, 23, 42, 0.75);
            --border-glow: rgba(0, 242, 254, 0.25);
            --neon-cyan: #00f2fe;
            --neon-blue: #4facfe;
            --neon-pink: #ff007f;
            --text-main: #f1f5f9;
            --text-muted: #94a3b8;
        }

        /* Sci-Fi Glass Navbar */
        .cyber-navbar {
            background: var(--surface-glass);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--border-glow);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
        }

        .cyber-brand {
            font-family: 'Orbitron', sans-serif;
            font-weight: 800;
            letter-spacing: 1.5px;
            background: linear-gradient(135deg, var(--neon-cyan), var(--neon-blue));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 12px rgba(0, 242, 254, 0.3);
        }

        .nav-link {
            color: var(--text-muted) !important;
            font-weight: 500;
            transition: all 0.2s ease-in-out;
            border-bottom: 2px solid transparent;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--neon-cyan) !important;
            border-bottom-color: var(--neon-cyan);
            text-shadow: 0 0 8px rgba(0, 242, 254, 0.5);
        }

        /* Cyber Input Field */
        .cyber-search-input {
            background: rgba(2, 6, 23, 0.6) !important;
            border: 1px solid rgba(0, 242, 254, 0.2) !important;
            color: #fff !important;
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.85rem;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .cyber-search-input:focus {
            border-color: var(--neon-cyan) !important;
            box-shadow: 0 0 10px rgba(0, 242, 254, 0.3) !important;
        }

        /* Futuristic User Avatar */
        .cyber-avatar {
            width: 34px;
            height: 34px;
            background: linear-gradient(135deg, rgba(0,242,254,0.2), rgba(79,172,254,0.2));
            border: 1.5px solid var(--neon-cyan);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            color: var(--neon-cyan);
            box-shadow: 0 0 10px rgba(0, 242, 254, 0.3);
        }

        /* Glow Buttons */
        .btn-cyber-primary {
            background: linear-gradient(135deg, var(--neon-cyan), var(--neon-blue));
            border: none;
            color: #000;
            font-weight: 700;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 0.5px;
            box-shadow: 0 0 15px rgba(0, 242, 254, 0.4);
            transition: all 0.3s ease;
        }

        .btn-cyber-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 0 22px rgba(0, 242, 254, 0.7);
            color: #000;
        }

        /* Cyber Dropdown */
        .cyber-dropdown {
            background: rgba(10, 15, 26, 0.95) !important;
            border: 1px solid var(--border-glow) !important;
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.8);
        }

        .cyber-dropdown .dropdown-item {
            color: var(--text-muted);
            font-size: 0.9rem;
            padding: 0.6rem 1.2rem;
            transition: all 0.2s;
        }

        .cyber-dropdown .dropdown-item:hover {
            background: rgba(0, 242, 254, 0.1);
            color: var(--neon-cyan);
        }

        .cyber-badge {
            font-family: 'JetBrains Mono', monospace;
            background: rgba(0, 242, 254, 0.1);
            color: var(--neon-cyan);
            border: 1px solid rgba(0, 242, 254, 0.3);
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg cyber-navbar sticky-top">
    <div class="container-fluid px-lg-5">

        <!-- Brand Logo -->
        <a class="navbar-brand cyber-brand me-4 d-flex align-items-center gap-2" href="<%= ctx %>/index.jsp">
            <i class="bi bi-cpu-fill text-cyan"></i>
            GIGSPHERE
        </a>

        <button class="navbar-toggler border-0"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#gsNavbar"
                aria-controls="gsNavbar"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="bi bi-list text-light fs-2"></i>
        </button>

        <div class="collapse navbar-collapse" id="gsNavbar">

            <!-- Dynamic Role Navigation -->
            <ul class="navbar-nav me-auto align-items-lg-center gap-lg-1">

                <% if (!loggedIn) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= "home".equals(activePage) ? "active" : "" %>"
                           href="<%= ctx %>/index.jsp">
                            <i class="bi bi-house-door me-1"></i> Home
                        </a>
                    </li>

                <% } else if ("CLIENT".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>"
                           href="<%= ctx %>/client/dashboard.jsp">Dashboard</a>
                    </li>

                    <li class="nav-item my-2 my-lg-0 me-lg-2">
                        <form action="<%= ctx %>/search" method="get" role="search">
                            <input type="search"
                                   name="keyword"
                                   class="form-control form-control-sm cyber-search-input px-3"
                                   placeholder="// Search projects..."
                                   aria-label="Search projects">
                        </form>
                    </li>

                    <li class="nav-item"><a class="nav-link <%= "projects".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/client/projects.jsp">Projects</a></li>
                    <li class="nav-item"><a class="nav-link <%= "proposals".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/client/proposals.jsp">Proposals</a></li>
                    <li class="nav-item"><a class="nav-link <%= "submissions".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/client/submissions.jsp">Submissions</a></li>
                    <li class="nav-item"><a class="nav-link <%= "messages".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/messages.jsp">Messages</a></li>

                <% } else if ("FREELANCER".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item">
                        <a class="nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>"
                           href="<%= ctx %>/freelancer/dashboard.jsp">Dashboard</a>
                    </li>

                    <li class="nav-item my-2 my-lg-0 me-lg-2">
                        <form action="<%= ctx %>/search" method="get" role="search">
                            <input type="search"
                                   name="keyword"
                                   class="form-control form-control-sm cyber-search-input px-3"
                                   placeholder="// Search nodes..."
                                   aria-label="Search projects">
                        </form>
                    </li>

                    <li class="nav-item"><a class="nav-link <%= "projects".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/freelancer/projects.jsp">Browse</a></li>
                    <li class="nav-item"><a class="nav-link <%= "proposals".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/freelancer/proposal.jsp">Proposals</a></li>
                    <li class="nav-item"><a class="nav-link <%= "assigned".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/freelancer/assigned-projects.jsp">Assigned</a></li>
                    <li class="nav-item"><a class="nav-link <%= "portfolio".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/freelancer/portfolio.jsp">Portfolio</a></li>
                    <li class="nav-item"><a class="nav-link <%= "reviews".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/freelancer/reviews.jsp">Reviews</a></li>
                    <li class="nav-item"><a class="nav-link <%= "messages".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/messages.jsp">Messages</a></li>

                <% } else if ("ADMIN".equalsIgnoreCase(sessRole)) { %>

                    <li class="nav-item"><a class="nav-link <%= "admin".equals(activePage) ? "active" : "" %>" href="<%= ctx %>/admin/dashboard.jsp">Control Panel</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%= ctx %>/admin/users.jsp">Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%= ctx %>/admin/projects.jsp">Projects</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%= ctx %>/admin/reviews.jsp">Reviews</a></li>

                <% } %>

            </ul>

            <!-- Right Controls -->
            <ul class="navbar-nav ms-auto align-items-lg-center gap-2">

                <% if (!loggedIn) { %>

                    <li class="nav-item">
                        <a class="nav-link" href="<%= ctx %>/auth/login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-cyber-primary btn-sm px-4 rounded-1" href="<%= ctx %>/auth/register.jsp">
                            INITIALIZE
                        </a>
                    </li>

                <% } else { %>

                    <!-- Notifications Dropdown Link -->
                    <li class="nav-item me-lg-2">
                        <a class="nav-link position-relative px-2" href="<%= ctx %>/notifications.jsp" title="Notifications">
                            <i class="bi bi-bell-fill fs-5 text-light"></i>
                            <% if (notificationCount > 0) { %>
                                <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-dark rounded-circle">
                                    <span class="visually-hidden">unread notifications</span>
                                </span>
                            <% } %>
                        </a>
                    </li>

                    <!-- User Profile Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center gap-2"
                           href="#"
                           role="button"
                           data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <span class="cyber-avatar">
                                <%= sessUser.substring(0, 1).toUpperCase() %>
                            </span>
                            <span class="fw-semibold text-light me-1">
                                <%= sessUser %>
                            </span>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-end cyber-dropdown rounded-2 mt-2">
                            <li class="px-3 py-2">
                                <span class="d-block text-muted small">ROLE IDENTIFIER</span>
                                <span class="badge cyber-badge mt-1"><%= sessRole %></span>
                            </li>
                            <li><hr class="dropdown-divider border-secondary opacity-25"></li>
                            <li>
                                <a class="dropdown-item" href="<%= ctx %>/activate-client">
                                    <i class="bi bi-person-workspace me-2"></i>Client Console
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="<%= ctx %>/activate-freelancer">
                                    <i class="bi bi-terminal me-2"></i>Freelancer Console
                                </a>
                            </li>
                            <li><hr class="dropdown-divider border-secondary opacity-25"></li>
                            <li>
                                <a class="dropdown-item text-danger" href="<%= ctx %>/logout">
                                    <i class="bi bi-power me-2"></i>Terminate Session
                                </a>
                            </li>
                        </ul>
                    </li>

                <% } %>

            </ul>

        </div>
    </div>
</nav>

<!-- System Flash Messages -->
<%
String flashSuccess = (String) session.getAttribute("flashSuccess");
String flashError = (String) session.getAttribute("flashError");

if (flashSuccess != null) session.removeAttribute("flashSuccess");
if (flashError != null) session.removeAttribute("flashError");
%>

<% if (flashSuccess != null) { %>
    <div class="container mt-3">
        <div class="alert alert-dark border border-info text-info alert-dismissible fade show mb-0" role="alert">
            <i class="bi bi-check2-circle me-2"></i><%= flashSuccess %>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
<% } %>

<% if (flashError != null) { %>
    <div class="container mt-3">
        <div class="alert alert-dark border border-danger text-danger alert-dismissible fade show mb-0" role="alert">
            <i class="bi bi-exclamation-octagon me-2"></i><%= flashError %>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
<% } %>

<main class="gs-main py-4">
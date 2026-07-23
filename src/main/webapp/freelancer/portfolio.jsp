<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.PortfolioItemDAO" %>
<%@ page import="com.gigsphere.dao.PortfolioItemDAOImpl" %>
<%@ page import="com.gigsphere.model.PortfolioItem" %>

<%
    request.setAttribute("pageTitle", "Portfolio");
    request.setAttribute("activePage", "portfolio");

    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }

    Integer freelancerId = (Integer) session.getAttribute("userId");

    PortfolioItemDAO portfolioDAO = new PortfolioItemDAOImpl();

    List<PortfolioItem> portfolioItems = portfolioDAO.findByFreelancerId(freelancerId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>My Portfolio</h3>
        <a href="<%= ctx %>/freelancer/add-portfolio.jsp" class="btn btn-primary">
            <i class="bi bi-plus-circle me-1"></i> Add Portfolio Item
        </a>
    </div>

    <div class="row">

        <% if (portfolioItems == null || portfolioItems.isEmpty()) { %>

        <div class="col-12">
            <div class="alert alert-info d-flex align-items-center" role="alert">
                <i class="bi bi-info-circle-fill me-2 fs-5"></i>
                <div>
                    You haven't added any portfolio items yet. Click the button above to showcase your work!
                </div>
            </div>
        </div>

        <% } else { %>

        <% for (PortfolioItem item : portfolioItems) { %>

        <div class="col-md-4 mb-4">

            <div class="card gs-card-hover h-100 shadow-sm">

                <div class="card-body d-flex flex-column">

                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <h5 class="card-title fw-bold mb-0">
                            <%= item.getTitle() != null ? item.getTitle() : "Untitled Project" %>
                        </h5>
                        <span class="badge bg-primary">
                            <%= item.getCategory() != null ? item.getCategory() : "General" %>
                        </span>
                    </div>

                    <p class="card-text flex-grow-1 text-secondary my-3">
                        <%= item.getDescription() != null ? item.getDescription() : "No description provided." %>
                    </p>

                    <div class="pt-3 border-top d-flex justify-content-end align-items-center">
                        <a href="<%= ctx %>/delete-portfolio?id=<%= item.getId() %>"
                           class="btn btn-outline-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this portfolio item?');">
                            <i class="bi bi-trash me-1"></i> Delete
                        </a>
                    </div>

                </div>

            </div>

        </div>

        <% } %>

        <% } %>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
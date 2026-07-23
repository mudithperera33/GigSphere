<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.PortfolioItemDAO" %>
<%@ page import="com.gigsphere.dao.PortfolioItemDAOImpl" %>
<%@ page import="com.gigsphere.model.PortfolioItem" %>

<%
    request.setAttribute("pageTitle", "Portfolio");

    if(session.getAttribute("user") == null){
        response.sendRedirect(
                request.getContextPath()
                        + "/auth/login.jsp");
        return;
    }

    Integer freelancerId = (Integer) session.getAttribute("userId");

    PortfolioItemDAO portfolioDAO = new PortfolioItemDAOImpl();

    List<PortfolioItem> portfolioItems =
            portfolioDAO.findByFreelancerId(freelancerId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>My Portfolio</h3>
        <a href="<%= request.getContextPath() %>/freelancer/add-portfolio.jsp"
           class="btn btn-primary">
            <i class="bi bi-plus-circle me-1"></i> Add Portfolio Item
        </a>
    </div>

    <div class="row">

        <% if (portfolioItems == null || portfolioItems.isEmpty()) { %>

        <div class="col-12">
            <div class="alert alert-info">
                You haven't added any portfolio items yet. Click the button above to showcase your work!
            </div>
        </div>

        <% } else { %>

        <% for(PortfolioItem item : portfolioItems){ %>

        <div class="col-md-4 mb-4">

            <div class="card gs-card-hover h-100">

                <div class="card-body d-flex flex-column">

                    <h5 class="card-title">
                        <%= item.getTitle() %>
                    </h5>

                    <p class="card-text flex-grow-1 text-secondary">
                        <%= item.getDescription() %>
                    </p>

                    <div>
                            <span class="badge bg-primary">
                                <%= item.getCategory() %>
                            </span>
                    </div>

                </div>

            </div>

        </div>

        <% } %>

        <% } %>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.ProjectDAO" %>
<%@ page import="com.gigsphere.dao.ProjectDAOImpl" %>
<%@ page import="com.gigsphere.dao.ProposalDAO" %>
<%@ page import="com.gigsphere.dao.ProposalDAOImpl" %>
<%@ page import="com.gigsphere.model.Project" %>
<%@ page import="com.gigsphere.model.Proposal" %>

<%
request.setAttribute("pageTitle", "Proposals");

if(session.getAttribute("user") == null){
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

Integer userId = (Integer) session.getAttribute("userId");

ProjectDAO projectDAO = new ProjectDAOImpl();
ProposalDAO proposalDAO = new ProposalDAOImpl();

List<Project> projects = projectDAO.findByClientId(userId);
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-4">

    <h3 class="mb-4">
        Project Proposals
    </h3>

    <% if (projects == null || projects.isEmpty()) { %>

        <div class="alert alert-info">
            You have not created any projects yet.
        </div>

    <% } else { %>

        <% for(Project project : projects){ %>

        <div class="card mb-4">

            <div class="card-header d-flex justify-content-between align-items-center">

                <strong>
                    <%= project.getTitle() %>
                </strong>

                <span class="badge bg-info">
                    <%= project.getStatus() %>
                </span>

                <span class="badge bg-secondary">
                    <%= project.getStatus() %>
                </span>

            </div>

            <div class="card-body">

                <%
                List<Proposal> proposals = proposalDAO.findByProjectId(project.getId());
                %>

                <% if(proposals == null || proposals.isEmpty()){ %>

                    <p class="text-muted mb-0">
                        No proposals submitted yet.
                    </p>

                <% } else { %>

                    <table class="table table-hover align-middle mb-0">

                        <thead>

                        <tr>

                            <th>Freelancer ID</th>
                            <th>Bid Amount</th>
                            <th>Expected Days</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                        </thead>

                        <tbody>

                        <% for(Proposal proposal : proposals){ %>

                        <tr>

                            <td>
                                <%= proposal.getFreelancerId() %>
                            </td>

                            <td>
                                LKR <%= String.format("%,.2f", proposal.getBidAmount()) %>
                            </td>

                            <td>
                                <%= proposal.getExpectedDays() %> days
                            </td>

                            <td>

                                <% if("PENDING".equalsIgnoreCase(proposal.getStatus())) { %>

                                    <span class="badge bg-warning text-dark">
                                        PENDING
                                    </span>

                                <% } else if("ACCEPTED".equalsIgnoreCase(proposal.getStatus())) { %>

                                    <span class="badge bg-success">
                                        ACCEPTED
                                    </span>

                                <% } else { %>

                                    <span class="badge bg-danger">
                                        REJECTED
                                    </span>

                                <% } %>

                            </td>

                            <td>

                                <% if("PENDING".equalsIgnoreCase(proposal.getStatus())) { %>

                                    <a href="<%= request.getContextPath() %>/accept-proposal?id=<%= proposal.getId() %>"
                                       class="btn btn-success btn-sm">
                                        <i class="bi bi-check-circle-fill me-1"></i>
                                        Accept
                                    </a>

                                <% } else if("ACCEPTED".equalsIgnoreCase(proposal.getStatus())) { %>

                                    <span class="badge bg-success">
                                        Accepted
                                    </span>

                                <% } else { %>

                                    <span class="badge bg-danger">
                                        Rejected
                                    </span>

                                <% } %>

                            </td>

                        </tr>

                        <% } %>

                        </tbody>

                    </table>

                <% } %>

            </div>

        </div>

        <% } %>

    <% } %>

</div>

<%@ include file="../includes/footer.jsp" %>
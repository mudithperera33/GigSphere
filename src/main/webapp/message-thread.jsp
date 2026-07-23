<%@ page import="java.util.List" %>
<%@ page import="com.gigsphere.dao.MessageDAO" %>
<%@ page import="com.gigsphere.dao.MessageDAOImpl" %>
<%@ page import="com.gigsphere.model.Message" %>

<%
request.setAttribute(
        "pageTitle",
        "Conversation"
);

if(session.getAttribute("user") == null){
    response.sendRedirect(
            request.getContextPath()
                    + "/auth/login.jsp"
    );
    return;
}

String projectIdParam = request.getParameter("projectId");
int projectId = 0;

if (projectIdParam != null && !projectIdParam.trim().isEmpty()) {
    try {
        projectId = Integer.parseInt(projectIdParam);
    } catch (NumberFormatException e) {
        response.sendRedirect(request.getContextPath() + "/conversations.jsp");
        return;
    }
} else {
    response.sendRedirect(request.getContextPath() + "/conversations.jsp");
    return;
}

MessageDAO dao = new MessageDAOImpl();
List<Message> messages = dao.findByProjectId(projectId);

Integer currentUserId = (Integer) session.getAttribute("userId");
%>

<%@ include file="includes/header.jsp" %>

<div class="container mt-4">

    <div class="card">

        <div class="card-header fw-bold">
            Project #<%= projectId %> Messages
        </div>

        <div class="card-body gs-chat-box">

            <% if (messages == null || messages.isEmpty()) { %>

                <p class="text-muted text-center my-3">No messages yet. Send a message to start the conversation!</p>

            <% } else { %>

                <% for(Message message : messages){ %>

                    <% if(currentUserId != null && message.getSenderId() == currentUserId){ %>

                        <div class="gs-message-self mb-2 text-end">

                            <small class="fw-bold">You</small>

                            <div>
                                <%= message.getContent() %>
                            </div>

                        </div>

                    <% } else { %>

                        <div class="gs-message-other mb-2">

                            <small class="fw-bold">
                                User <%= message.getSenderId() %>
                            </small>

                            <div>
                                <%= message.getContent() %>
                            </div>

                        </div>

                    <% } %>

                <% } %>

            <% } %>

        </div>

        <div class="card-footer">

            <form action="<%= request.getContextPath() %>/send-message" method="post">

                <input type="hidden"
                       name="projectId"
                       value="<%= projectId %>">

                <div class="input-group">

                    <input
                            type="text"
                            name="content"
                            class="form-control"
                            placeholder="Type a message..."
                            required>

                    <button
                            type="submit"
                            class="btn btn-primary">

                        Send

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<%@ include file="includes/footer.jsp" %>
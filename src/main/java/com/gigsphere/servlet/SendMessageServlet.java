package com.gigsphere.servlet;

import com.gigsphere.dao.MessageDAO;
import com.gigsphere.dao.MessageDAOImpl;
import com.gigsphere.model.Message;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/send-message")
public class SendMessageServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        int projectId =
                Integer.parseInt(
                        request.getParameter("projectId")
                );

        String content =
                request.getParameter("content");

        Integer senderId =
                (Integer) request.getSession()
                        .getAttribute("userId");

        Message message =
                new Message();

        message.setProjectId(projectId);
        message.setSenderId(senderId);
        message.setContent(content);

        MessageDAO dao =
                new MessageDAOImpl();

        dao.save(message);

        response.sendRedirect(
                request.getContextPath()
                        + "/message-thread.jsp?projectId="
                        + projectId
        );
    }
}
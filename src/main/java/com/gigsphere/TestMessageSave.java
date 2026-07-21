package com.gigsphere;

import com.gigsphere.dao.MessageDAO;
import com.gigsphere.dao.MessageDAOImpl;
import com.gigsphere.model.Message;

public class TestMessageSave {

    public static void main(String[] args) {

        Message message =
                new Message();

        message.setProjectId(1);

        message.setSenderId(1);

        message.setContent(
                "Hello, I have started working on the project."
        );

        MessageDAO dao =
                new MessageDAOImpl();

        boolean saved =
                dao.save(message);

        System.out.println(
                "Saved: " + saved
        );
    }
}
package com.gigsphere;

import com.gigsphere.dao.MessageDAO;
import com.gigsphere.dao.MessageDAOImpl;
import com.gigsphere.model.Message;

import java.util.List;

public class TestProjectMessages {

    public static void main(String[] args) {

        MessageDAO dao =
                new MessageDAOImpl();

        List<Message> messages =
                dao.findByProjectId(1);

        for(Message message : messages) {

            System.out.println(
                    message.getSenderId()
                            + " : "
                            + message.getContent()
            );
        }
    }
}
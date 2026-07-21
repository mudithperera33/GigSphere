package com.gigsphere;

import com.gigsphere.dao.NotificationDAO;
import com.gigsphere.dao.NotificationDAOImpl;
import com.gigsphere.model.Notification;

public class TestNotification {

    public static void main(String[] args) {

        Notification notification =
                new Notification();

        notification.setUserId(1);

        notification.setType(
                "PROPOSAL");

        notification.setMessage(
                "Your proposal was accepted."
        );

        NotificationDAO dao =
                new NotificationDAOImpl();

        System.out.println(
                dao.save(notification)
        );
    }
}
package com.gigsphere.dao;

import com.gigsphere.model.Notification;

import java.util.List;

public interface NotificationDAO {

    boolean save(Notification notification);

    List<Notification> findByUserId(int userId);

    boolean markAsRead(int notificationId);
}
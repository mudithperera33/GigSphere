package com.gigsphere.dao;

import com.gigsphere.model.Message;

import java.util.List;

public interface MessageDAO {

    boolean save(Message message);

    List<Message> findByProjectId(int projectId);

    boolean markAsRead(int messageId);
}
package com.gigsphere.dao;

import com.gigsphere.model.Submission;

public interface SubmissionDAO {

    boolean save(Submission submission);

    Submission findByProjectId(int projectId);
}
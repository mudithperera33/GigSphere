package com.gigsphere.dao;

import com.gigsphere.model.SubmissionVersion;

import java.util.List;

public interface SubmissionVersionDAO {

    boolean save(SubmissionVersion version);

    List<SubmissionVersion> findBySubmissionId(
            int submissionId
    );

    boolean updateStatus(
            int versionId,
            String status,
            String clientNote
    );
}
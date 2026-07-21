package com.gigsphere.service;

import com.gigsphere.dao.ProjectDAO;
import com.gigsphere.dao.ProjectDAOImpl;
import com.gigsphere.dao.SubmissionVersionDAO;
import com.gigsphere.dao.SubmissionVersionDAOImpl;

public class SubmissionReviewService {

    private final SubmissionVersionDAO versionDAO;
    private final ProjectDAO projectDAO;

    public SubmissionReviewService() {

        versionDAO =
                new SubmissionVersionDAOImpl();

        projectDAO =
                new ProjectDAOImpl();
    }

    public boolean approveSubmission(
            int versionId,
            int projectId
    ) {

        versionDAO.updateStatus(
                versionId,
                "APPROVED",
                "Approved"
        );

        return projectDAO.updateStatus(
                projectId,
                "COMPLETED"
        );
    }

    public boolean requestRevision(
            int versionId,
            int projectId,
            String note
    ) {

        versionDAO.updateStatus(
                versionId,
                "REVISION_REQUESTED",
                note
        );

        return projectDAO.updateStatus(
                projectId,
                "REVISION_REQUESTED"
        );
    }
}
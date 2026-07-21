package com.gigsphere;

import com.gigsphere.dao.SubmissionVersionDAO;
import com.gigsphere.dao.SubmissionVersionDAOImpl;
import com.gigsphere.model.SubmissionVersion;

public class TestSubmissionVersion {

    public static void main(String[] args) {

        SubmissionVersion version =
                new SubmissionVersion();

        version.setSubmissionId(1);

        version.setVersionNumber(1);

        version.setFileName(
                "project_final.pdf");

        version.setFileType(
                "pdf");

        version.setFileSizeBytes(
                500000);

        version.setStatus(
                "SUBMITTED");

        version.setClientNote(
                null);

        SubmissionVersionDAO dao =
                new SubmissionVersionDAOImpl();

        boolean result =
                dao.save(version);

        System.out.println(
                "Saved: " + result
        );
    }
}
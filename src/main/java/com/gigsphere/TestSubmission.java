package com.gigsphere;

import com.gigsphere.dao.SubmissionDAO;
import com.gigsphere.dao.SubmissionDAOImpl;
import com.gigsphere.model.Submission;

public class TestSubmission {

    public static void main(String[] args) {

        Submission submission =
                new Submission();

        submission.setProjectId(1);

        submission.setFreelancerId(1);

        submission.setCurrentVersion(1);

        SubmissionDAO dao =
                new SubmissionDAOImpl();

        boolean saved =
                dao.save(submission);

        System.out.println(
                "Submission Saved: " + saved
        );
    }
}
package com.gigsphere;

import com.gigsphere.dao.ReviewDAO;
import com.gigsphere.dao.ReviewDAOImpl;
import com.gigsphere.model.Review;

public class TestReview {

    public static void main(String[] args) {

        Review review =
                new Review();

        review.setProjectId(1);

        review.setReviewerId(1);

        review.setRevieweeId(1);

        review.setRating(5);

        review.setComment(
                "Excellent work!"
        );

        ReviewDAO dao =
                new ReviewDAOImpl();

        boolean saved =
                dao.save(review);

        System.out.println(
                "Saved: " + saved
        );

        System.out.println(
                "Average Rating: "
                        + dao.getAverageRating(1)
        );
    }
}
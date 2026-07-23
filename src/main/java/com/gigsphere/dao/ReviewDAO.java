package com.gigsphere.dao;

import com.gigsphere.model.Review;

import java.util.List;

public interface ReviewDAO {

    boolean save(Review review);

    List<Review> findByUserId(int userId);

    List<Review> findAll();

    double getAverageRating(int userId);
}
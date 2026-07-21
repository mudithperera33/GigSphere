package com.gigsphere.dao;

import com.gigsphere.model.PortfolioItem;

import java.util.List;

public interface PortfolioItemDAO {

    boolean save(PortfolioItem item);

    List<PortfolioItem> findByFreelancerId(
            int freelancerId);
}
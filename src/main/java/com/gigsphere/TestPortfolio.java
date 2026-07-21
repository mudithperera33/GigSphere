package com.gigsphere;

import com.gigsphere.dao.PortfolioItemDAO;
import com.gigsphere.dao.PortfolioItemDAOImpl;
import com.gigsphere.model.PortfolioItem;

public class TestPortfolio {

    public static void main(String[] args) {

        PortfolioItem item =
                new PortfolioItem();

        item.setFreelancerId(1);

        item.setProjectId(1);

        item.setTitle(
                "E-Commerce Website");

        item.setDescription(
                "Developed using Java");

        item.setCategory(
                "Web Development");

        item.setFileName(
                "ecommerce.pdf");

        PortfolioItemDAO dao =
                new PortfolioItemDAOImpl();

        boolean result =
                dao.save(item);

        System.out.println(
                "Saved: " + result);
    }
}
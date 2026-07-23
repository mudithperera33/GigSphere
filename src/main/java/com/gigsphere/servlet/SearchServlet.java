package com.gigsphere.servlet;

import com.gigsphere.model.Project;
import com.gigsphere.service.SearchService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        if (keyword == null) {
            keyword = "";
        }

        SearchService searchService = new SearchService();

        List<Project> results = searchService.searchProjects(keyword);

        request.setAttribute("keyword", keyword);
        request.setAttribute("results", results);

        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
}
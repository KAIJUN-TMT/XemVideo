package com.j4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

@WebServlet("/tim-kiem")
public class SearchVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VideoDAO videoDAO = new VideoDAO(); // Đảm bảo bạn đã có lớp VideoDAO

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        List<Video> matchedVideos;
        if (keyword != null && !keyword.trim().isEmpty()) {
            matchedVideos = videoDAO.searchByTitle(keyword.trim());
        } else {
            matchedVideos = new ArrayList<>(); // Không hiển thị gì nếu không nhập
        }

        request.setAttribute("videos", matchedVideos);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/views/client/timkiem.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Cho phép submit bằng POST (nếu có)
    }
}

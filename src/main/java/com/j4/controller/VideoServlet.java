package com.j4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.j4.dao.VideoDAO;
import com.j4.entity.Video;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet({"/videos/list","/videos/chi-tiet"})
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uriString = request.getRequestURI();
		request.getSession().setAttribute("uriString", uriString);
		if (uriString.contains("videos/chi-tiet")) {
			request.getRequestDispatcher("/views/client/video/detail.jsp").forward(request, response);
		}else {
			List<Video> list = VideoDAO.findAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/client/video/list.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
